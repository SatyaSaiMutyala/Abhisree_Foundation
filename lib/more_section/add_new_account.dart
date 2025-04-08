import 'dart:convert';
import 'dart:io';

import 'package:adhisree_foundation/controllers/AddBankDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/widgets/custom_cards.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';

class AddNewAccountScreen extends StatefulWidget {
  @override
  _AddNewAccountState createState() => _AddNewAccountState();
}

class _AddNewAccountState extends State<AddNewAccountScreen> {
  final Addbankdetailscontroller addbankdetailscontroller = Get.put(Addbankdetailscontroller());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountHolderController =
      TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();

  File? _photo;
  int? userId;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isPhoto) async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 60);

    if (pickedFile != null) {
      setState(() {
        _photo = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userData = jsonDecode(userJson);
      setState(() {
        userId = userData['id'];
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_photo == null) {
        _showSnackBar("Please upload your photo");
        return;
      }

      if (userId == null) {
        _showSnackBar("User not found. Please log in again.");
        return;
      }

      final bankDetails = {
          "bank_name" : _bankNameController.text,
          "account_number" : _accountNameController.text,
          "ifsc" : _ifscController.text,
          "user_id" : userId,
          "holder_name" : _accountHolderController.text,
          "image" : _photo!.path,
      };

      // All validations passed
      print("Bank Name: ${_bankNameController.text}");
      print("Account Holder: ${_accountHolderController.text}");
      print("Account Number: ${_accountNameController.text}");
      print("IFSC: ${_ifscController.text}");
      print("User ID: $userId");
      print('image path : ${_photo}');

      addbankdetailscontroller.submitBankData('save_bank_details', bankDetails);
      
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Title
            Positioned(
              top: height * 0.07,
              left: width * 0.25,
              child: Container(
                width: width * 0.5,
                height: height * 0.04,
                alignment: Alignment.center,
                child: Text(
                  "Add New Account Details",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.fontSizeExtraLarge,
                    height: 33 / 16,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Back Button
            Positioned(
              top: height * 0.065,
              left: width * 0.05,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: width * 0.1,
                  height: height * 0.05,
                  padding: EdgeInsets.fromLTRB(8, 7, 8, 7),
                  decoration: BoxDecoration(
                    color: Color(0XFFEFEEEE),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: width * 0.05,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Form
            Padding(
              padding: EdgeInsets.only(top: height * 0.18, left: 21, right: 21),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldScreen(
                      "Bank Name",
                      controller: _bankNameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter bank name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.03),
                    textFieldScreen(
                      "Account Holder Name",
                      controller: _accountHolderController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter account holder name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.03),
                    textFieldScreen(
                      "Account Number",
                      controller: _accountNameController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter account number";
                        }
                        if (!RegExp(r'^\d{6,20}$').hasMatch(value)) {
                          return "Enter a valid account number";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.03),
                    textFieldScreen(
                      "IFSC Code",
                      controller: _ifscController,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.characters,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter IFSC code";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.03),
                    GestureDetector(
                      onTap: () => _pickImage(true),
                      child: UploadCard(title: "Upload your photo", image: _photo),
                    ),
                    SizedBox(height: height * 0.06),
                    CustomButton(
                      text: 'Add Bank Details',
                      onPressed: _submitForm,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
