

import 'package:adhisree_foundation/controllers/userController.dart';
import 'package:adhisree_foundation/loginScreen/OtpScreen.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginwithnumberscreen extends StatefulWidget {
  @override
  _LoginWithNumberState createState() => _LoginWithNumberState();
}

class _LoginWithNumberState extends State<Loginwithnumberscreen> {
  final UserController userController = Get.put(UserController());
  final TextEditingController _numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submitNumber() {
    if (_formKey.currentState!.validate()) {
      final number = _numberController.text.trim();
      userController.submitUserData('register', {'phone_number': number});
      Get.to(Otpscreen(), arguments: {'phoneNumber': number});
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(width * 0.02),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0XFFEFEEEE),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => Get.toNamed(AppRoutes.messageScreen),
              icon: Icon(Icons.arrow_back, color: Colors.black, size: width * 0.05),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Color.fromARGB(255, 181, 233, 240),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: height * 0.01),
                Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Welcome back !',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height * 0.03),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(
                            fontSize: width * 0.032,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFF9F7F7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: _numberController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            final pattern = RegExp(r'^[6-9]\d{9}$');
                            if (!pattern.hasMatch(value)) {
                              return 'Enter a valid 10-digit number\nstarting with 6-9';
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Mobile Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.015,
                              horizontal: width * 0.03,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.018,
                    horizontal: width * 0.07,
                  ),
                  child: CustomButton(
                    text: 'LOG IN',
                    onPressed: submitNumber,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.015),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.referralCode),
                    child: Text(
                      'I have a referral code',
                      style: TextStyle(
                        color: Color(0XFF338D9B),
                        fontSize: width * 0.035,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
