import 'dart:convert';

import 'package:adhisree_foundation/widgets/custom_cards.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentsScreen extends StatefulWidget {
  @override
  _DocumentScreen createState() => _DocumentScreen();
}

class _DocumentScreen extends State<DocumentsScreen> {
  int? userId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? photoPath;

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
        firstName = userData['first_name'];
        lastName = userData['last_name'];
        phoneNumber = userData['phone_number'];
        photoPath = userData['photo_path'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get device width & height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.052),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Working back button
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

              SizedBox(height: height * 0.02), // Space after back button

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Text
                      Text(
                        'Abhisree Foundation Documents',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(height: width * 0.02),
                      // Description
                      Text(
                        'Download the joining confirmation, offer letter, ID card, and visiting card required to volunteer at Abhisree Foundation.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF6F6B6B),
                        ),
                      ),
                      SizedBox(height: height * 0.045),
                      _buildDocumentCard('Joining Confirmation Letter', width),
                      _buildDocumentCard('NDA', width),
                      _buildDocumentCard('ID Card', width),
                      _buildDocumentCard('Visiting Card', width),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentCard(String documentName, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Document Name Row with Download Icon
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.5,
              height: width * 0.04,
              child: Text(
                documentName.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.034,
                  height: 16 / 14,
                  letterSpacing: 0,
                  color: Colors.black,
                ),
              ),
            ),
            Image.asset("assets/icons/download_icon.png",
                color: Color(0XFF338D9B)),
            IconButton(
              icon: Icon(Icons.visibility_outlined,
                  color: Color(0XFF338D9B), size: 20),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: width * 0.02),

        // Custom card or spacing
        // You can uncomment and use your custom card if needed:
        // CustomCard(),

        SizedBox(height: width * 0.04),
      ],
    );
  }
}
