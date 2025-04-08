import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controllers/userController.dart';
import '../widgets/text_feilds.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetailsScreen> {
  final UserController userController = Get.put(UserController());
  final _formKey = GlobalKey<FormState>(); 
  String referralCode = '';
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    referralCode = Get.arguments?['referralCode'] ?? '';
    print('this is ref code ------------>$referralCode');
  }

  Future<void> submitUserData() async {
    if (!_formKey.currentState!.validate()) {
      return; // Stop if validation fails
    }


    Map<String, dynamic> userData = {
      'first_name': _firstNameController.text,
      'last_name': _lastNameController.text,
      'email': _emailController.text,
      'phone_number': _phoneController.text,
      'gender': _genderController.text,
      'user_type': 'donar',
      'address': _addressController.text,
      'ref_id': referralCode,
    };
    userController.submitUserDataViaRefId("save_user_with_refereal",userData);

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Assign form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textFieldScreen("First Name",
                    keyboardType: TextInputType.name,
                    controller: _firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    }),
                SizedBox(height: height * 0.03),
                textFieldScreen("Last Name",
                    keyboardType: TextInputType.name,
                    controller: _lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    }),
                SizedBox(height: height * 0.03),
                textFieldScreen("Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }),
                SizedBox(height: height * 0.03),
                textFieldScreen("Phone Number",
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Enter a valid 10-digit phone number';
                      }
                      return null;
                    }),
                SizedBox(height: height * 0.03),
                textFieldScreen("Address",
                    keyboardType: TextInputType.text,
                    controller: _addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    }),
                SizedBox(height: height * 0.03),
                textFieldScreen("Gender",
                    keyboardType: TextInputType.text,
                    controller: _genderController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your gender';
                      }
                      return null;
                    }),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: width * 0.04, horizontal: width * 0.04),
                  child: CustomButton(text: 'Submit', onPressed: submitUserData),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
