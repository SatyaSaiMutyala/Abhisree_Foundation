import 'dart:convert';
import 'dart:io';

import 'package:adhisree_foundation/controllers/profileUpdateController.dart';
import 'package:adhisree_foundation/models/getuserModal.dart';
import 'package:adhisree_foundation/utils/constants.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/UserDetailsController.dart';
import '../controllers/userController.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserProgressController _controller = Get.put(UserProgressController());
  final Profileupdatecontroller profileController =
      Get.put(Profileupdatecontroller());

  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isEditing = false;
  int? userId;
  String? photoPath;

  final TextEditingController _firstNameController =
      TextEditingController(text: "");
  final TextEditingController _lastNameController =
      TextEditingController(text: "");
  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _phoneController =
      TextEditingController(text: "");
  final TextEditingController _genderController =
      TextEditingController(text: "");

  void _showImageSourcePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Select Image From",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _getImageFromSource(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text("Camera"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _getImageFromSource(ImageSource.gallery);
                  },
                  icon: Icon(Icons.photo_library),
                  label: Text("Gallery"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getImageFromSource(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');

    if (userJson != null) {
      Map<String, dynamic> decodedUserData = jsonDecode(userJson);

      userId = decodedUserData['id'];

      if (userId != null) {
        await _controller.fetchUserProgress(userId.toString());

        final user = _controller.userProgress.value;
        if (user != null) {
          setState(() {
            _firstNameController.text = user.firstName ?? '';
            _lastNameController.text = user.lastName ?? '';
            _emailController.text = user.email ?? '';
            _phoneController.text = user.phoneNumber;
            _genderController.text = user.gender ?? '';
            photoPath = user.photoPath ?? '';
          });
          await prefs.setString('user', jsonEncode(user));
        }
      }

      print("User ID: $userId");
      print("User ID: $photoPath");
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
                          : (photoPath != null && photoPath!.isNotEmpty)
                              ? Image.network('${photoPath!}',
                                  fit: BoxFit.cover)
                              : Image.asset('assets/images/Png/user.png',
                                  fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!_isEditing) {
                        setState(() {
                          _isEditing = true;
                        });
                      } else {
                        _showImageSourcePicker(context);
                      }
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
            textFieldScreen("Email ID",
                keyboardType: TextInputType.emailAddress,
                controller: _emailController),
            SizedBox(height: height * 0.02),
            textFieldScreen("Phone Number",
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                readOnly: true),
            SizedBox(height: height * 0.02),
            textFieldScreen(
              "Gender",
              controller: _genderController,
              validator: (value) => value == null || value.isEmpty
                  ? "Please select gender"
                  : null,
              isDropdown: true,
              dropdownItems: ['Male', 'Female'],
            ),

            if (_isEditing) ...[
              SizedBox(height: height * 0.04),
              CustomButton(
                text: 'SAVE DETAILS',
                onPressed: () {
                  final updatedData = {
                    "user_id": userId,
                    "first_name": _firstNameController.text.trim(),
                    "last_name": _lastNameController.text.trim(),
                    "email": _emailController.text.trim(),
                    "phone_number": _phoneController.text.trim(),
                    "gender": _genderController.text.trim(),
                    "photo_path": _image != null ? _image!.path : "",
                  };

                  profileController.submitUserData(
                      'updateProfile', updatedData);

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
