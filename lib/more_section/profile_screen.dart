import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isEditing = false;

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
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Profile"),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(height: height * 0.03),
            // Profile Image Section
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 136,
                    height: 136,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0XFF338D9B), width: 4),
                      color: Color(0xFFE9E6E6),
                    ),
                    child: ClipOval(
                      child: _image != null
                          ? Image.file(_image!, fit: BoxFit.cover)
                          : Image.asset('assets/images/Png/teams1.png',
                              fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isEditing = !_isEditing;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0XFF338D9B), width: 4),
                      ),
                      padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                      child: _isEditing
                          ? Icon(Icons.camera_alt,
                              color: Colors.black, size: width * 0.05)
                          : Image.asset("assets/icons/pencil-edit_icon.png",
                              width: width * 0.05, height: height * 0.028),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.06),

            // Form Fields
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
            SizedBox(height: height * 0.02),
            textFieldScreen(
                "Email ID", keyboardType: TextInputType.emailAddress, controller: _emailController),
            SizedBox(height: height * 0.02),
            textFieldScreen(
                "Phone Number", keyboardType: TextInputType.phone, controller: _phoneController),
            SizedBox(height: height * 0.02),
            textFieldScreen(
                "Gender", keyboardType: TextInputType.text, controller: _genderController),

            if (_isEditing) ...[
              SizedBox(height: height * 0.04),
              CustomButton(
                text: 'SAVE DETAILS',
                onPressed: () {
                  setState(() {
                    _isEditing = false;
                  });
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
