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
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // Profile Image with Clickable Border for Editing
            GestureDetector(
              onTap: () {
                setState(() {
                  _isEditing = !_isEditing; // Toggle edit mode on border tap
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: ClipOval(
                      child: _image != null
                          ? Image.file(_image!, fit: BoxFit.cover)
                          : Image.asset("assets/teams1.png",
                              fit: BoxFit.cover),
                    ),
                  ),
                  // Edit/Camera Icon Inside the Border
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _isEditing
                          ? _pickImage
                          : null, // Enable image pick only in edit mode
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          _isEditing
                              ? Icons.camera_alt
                              : Icons.edit, // Toggle icons
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Profile Fields
            Row(
              children: [
                Expanded(
                    child: _buildTextField("First Name", _firstNameController)),
                SizedBox(width: 12), // Space between fields
                Expanded(
                    child: _buildTextField("Last Name", _lastNameController)),
              ],
            ),

            SizedBox(height: 12),
            _buildTextField("Email ID", _emailController,
                keyboardType: TextInputType.emailAddress),
            SizedBox(height: 12),
            _buildTextField("Phone Number", _phoneController,
                keyboardType: TextInputType.phone),
            SizedBox(height: 12),
            _buildTextField("Gender", _genderController),

            if (_isEditing) SizedBox(height: 20),
            if (_isEditing)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isEditing = false; // Disable editing after submitting
                  });
                },
                child: Text("SAVE DETAILS",
                style: TextStyle(
                  color: Color(0XFF338D9B),
                ),),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          readOnly: !_isEditing, // Read-only when not in edit mode
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFE4E4E4),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          ),
        ),
      ],
    );
  }
}
