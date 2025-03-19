import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image; // Store selected image
  final ImagePicker _picker = ImagePicker();
  bool _isEditing = false; // Control edit mode

  final TextEditingController _firstNameController =
      TextEditingController(text: "Prasanth");
  final TextEditingController _lastNameController =
      TextEditingController(text: "Varma");
  final TextEditingController _emailController =
      TextEditingController(text: "prasanthvarma23@gmail.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "9876543210");
  final TextEditingController _genderController =
      TextEditingController(text: "Male");

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.0625, vertical: width * 0.0625),
            child: Column(
              children: [
                SizedBox(height: height * 0.34), // Adjusted to prevent overlap
                Row(
                  children: [
                    Expanded(
                      child: textFieldScreen(
                        "First Name",
                        keyboardType: TextInputType.name,
                        controller: _firstNameController,
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    Expanded(
                      child: textFieldScreen(
                        "Last Name",
                        keyboardType: TextInputType.name,
                        controller: _lastNameController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                textFieldScreen(
                  "Email ID",
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                SizedBox(height: height * 0.03),
                textFieldScreen(
                  "Phone Number",
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                ),
                SizedBox(height: height * 0.03),
                textFieldScreen(
                  "Gender",
                  keyboardType: TextInputType.text,
                  controller: _genderController,
                ),

                if (_isEditing) SizedBox(height: height * 0.06),
                if (_isEditing)
                  CustomButton(
                    text: 'SAVE DETAILS',
                    onPressed: () {
                      setState(() {
                        _isEditing = false;
                      });
                      // Navigator.pushNamed(context, AppRoutes.OtpScreen);
                    },
                  ),
              ],
            ),
          ),

          // Positioned Profile Text
          Positioned(
            top: height * 0.07,
            left: width * 0.35, // Centered dynamically
            child: Container(
              width: width * 0.3,
              height: height * 0.04,
              alignment: Alignment.center,
              child: Text(
                "Profile",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.05,
                  height: 33 / 16, // Line-height equivalent
                  letterSpacing: 0,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Positioned Back Icon
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
                padding: EdgeInsets.fromLTRB(8, 7, 8, 7), // Padding as required
                decoration: BoxDecoration(
                  color:
                      Color(0XFFEFEEEE), // Background color (Change if needed)
                  shape: BoxShape.circle, // Circular button
                  // border: Border.all(color: Color(0XFF338D9B), width: 2), // Border
                ),
                child: Icon(
                  Icons.arrow_back, // Back icon
                  size: width * 0.05, // Adjust size inside container
                  color: Colors.black, // Icon color
                ),
              ),
            ),
          ),

          // **Positioned Profile Image**
          Positioned(
            top: width * 0.35,
            left: width * 0.34,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isEditing = !_isEditing;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 136,
                    height: 136,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0XFF338D9B), width: 4),
                      color: Color(0xFFE9E6E6), // Background color
                    ),
                    child: ClipOval(
                      child: _image != null
                          ? Image.file(_image!, fit: BoxFit.cover)
                          : Image.asset('assets/images/Png/teams1.png',
                              fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: width * 0.025,
                    right: 0,
                    child: GestureDetector(
                      onTap: _isEditing ? _pickImage : null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0XFF338D9B), width: 4),
                        ),
                        padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                        child: _isEditing
                            ? Icon(Icons.camera_alt,
                                color: Colors.black, size: width * 0.05)
                            : Image.asset("assets/icons/pencil-edit_icon.png",
                                width: width * 0.05, height: height * 0.028),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
