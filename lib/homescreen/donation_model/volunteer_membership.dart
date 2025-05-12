import 'dart:convert';
import 'dart:io';
import 'package:adhisree_foundation/controllers/AddVoluntreeController.dart';
import 'package:adhisree_foundation/controllers/GetRefDataController.dart';
import 'package:adhisree_foundation/homescreen/donation_model/VolunteerSummary.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/widgets/custom_cards.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VolunteerMembership extends StatefulWidget {
  const VolunteerMembership({Key? key}) : super(key: key);

  @override
  State<VolunteerMembership> createState() => _VolunteerMembershipState();
}

class _VolunteerMembershipState extends State<VolunteerMembership> {
  final _formKey = GlobalKey<FormState>();
  final Addvolunteercontroller addvolunteercontroller =
      Get.put(Addvolunteercontroller());
  final GetRefDataController getRefDataController = Get.put(GetRefDataController());    

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _aadharNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _refController = TextEditingController();

  File? _photo;
  File? _aadharImage;
  int? userId;
  String? refCode;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isPhoto) async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 60);

    if (pickedFile != null) {
      setState(() {
        if (isPhoto) {
          _photo = File(pickedFile.path);
        } else {
          _aadharImage = File(pickedFile.path);
        }
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
        refCode = userData['ref_id'];
      });
      await getRefDataController.fetchRefData('get-user-data-withid', userId.toString());
      final data = getRefDataController.user.value;
      _firstNameController.text = data!.firstName ?? '';
      _lastNameController.text = data.lastName ?? '';
      // _addressController.text = data.
      _emailController.text = data.email ?? '';
      _genderController.text = data.gender ?? '';

    }
    _refController.text = refCode ?? '';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.052),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Back & Help
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: width * 0.1,
                      height: height * 0.05,
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
                  // Help Text
                  Text(
                    'Help ?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.034,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),

              // Scrollable Form
              Expanded(
                child: SingleChildScrollView(
                  // physics: BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Volunteer Membership Enrollment Form',
                          style: TextStyle(
                            fontSize: width * 0.049,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: width * 0.02),
                        Text(
                          'Interested user must complete the membership form and pay',
                          style: TextStyle(
                            fontSize: width * 0.034,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF6F6B6B),
                          ),
                        ),
                        SizedBox(height: height * 0.045),
                        GestureDetector(
                          onTap: () => _pickImage(true),
                          child: UploadCard(
                              title: "Upload your photo", image: _photo),
                        ),
                        SizedBox(height: height * 0.03),
                        GestureDetector(
                          onTap: () => _pickImage(false),
                          child: UploadCard(
                              title: "Upload your Aadhar photo",
                              image: _aadharImage),
                        ),
                        SizedBox(height: height * 0.03),
                        textFieldScreen(
                          "First Name",
                          keyboardType: TextInputType.name,
                          controller: _firstNameController,
                          validator: (value) => value == null || value.isEmpty
                              ? "Please enter first name"
                              : null,
                        ),
                        SizedBox(height: height * 0.03),
                        textFieldScreen(
                          "Last Name",
                          keyboardType: TextInputType.name,
                          controller: _lastNameController,
                          validator: (value) => value == null || value.isEmpty
                              ? "Please enter last name"
                              : null,
                        ),
                        SizedBox(height: height * 0.03),
                        textFieldScreen(
                          "Email",
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter email';
                            final regex =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
                            return regex.hasMatch(value)
                                ? null
                                : 'Enter valid email';
                          },
                        ),
                        SizedBox(height: height * 0.03),
                        textFieldScreen("Pan",
                            keyboardType: TextInputType.name,
                            controller: _panController, validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter PAN";
                          }

                          final panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');
                          if (!panRegex.hasMatch(value)) {
                            return "Invalid PAN format. Example: ABCDE1234F";
                          }
                          return null;
                        }),
                        SizedBox(height: height * 0.03),
                        textFieldScreen(
                          "Aadhar Number",
                          keyboardType: TextInputType.number,
                          controller: _aadharNumberController,
                          validator: (value) =>
                              value == null || value.length != 12
                                  ? "Enter 12-digit Aadhar number"
                                  : null,
                        ),
                        SizedBox(height: height * 0.03),
                        textFieldScreen(
                          "Address",
                          keyboardType: TextInputType.name,
                          controller: _addressController,
                          validator: (value) => value == null || value.isEmpty
                              ? "Please enter address"
                              : null,
                        ),
                        SizedBox(height: height * 0.03),
                        // textFieldScreen(
                        //   "Referal Code",
                        //   keyboardType: TextInputType.name,
                        //   controller: _refController,
                        // ),
                        // SizedBox(height: height * 0.03),
                        textFieldScreen(
                          "Gender",
                          controller: _genderController,
                          validator: (value) => value == null || value.isEmpty
                              ? "Please select gender"
                              : null,
                          isDropdown: true,
                          dropdownItems: ['Male', 'Female'],
                        ),
                        SizedBox(height: height * 0.06),
                        CustomButton(
                          text: 'Continue',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (_photo == null || _aadharImage == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Please upload both images')),
                                );
                              } else {
                                handleSubmitData();
                              }
                            }
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleSubmitData() {
    final Map<String, dynamic> details = {
      "user_id": userId,
      "first_name": _firstNameController.text.trim(),
      "last_name": _lastNameController.text.trim(),
      "email": _emailController.text.trim(),
      "pan": _panController.text.trim(),
      "aadhar_number": _aadharNumberController.text.trim(),
      "address": _addressController.text.trim(),
      "gender": _genderController.text.trim(),
      "photo": _photo,
      "aadhar_photo": _aadharImage,
    };
    Navigator.pushNamed(
      context,
      AppRoutes.volunteerSummary,
      arguments: details,
    );

  }
}
