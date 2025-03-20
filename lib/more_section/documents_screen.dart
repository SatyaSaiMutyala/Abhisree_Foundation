import 'package:adhisree_foundation/widgets/custom_cards.dart';
import 'package:flutter/material.dart';

class DocumentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get device width & height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Back Button
            Positioned(
              top: height * 0.03, // Adjusted for better alignment
              left: width * 0.05,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: width * 0.1,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: Color(0XFFEFEEEE), // Background color
                    shape: BoxShape.circle, // Circular button
                  ),
                  child: Icon(
                    Icons.arrow_back, // Back icon
                    size: width * 0.05, // Adjust size inside container
                    color: Colors.black, // Icon color
                  ),
                ),
              ),
            ),

            // Scrollable Content
            SingleChildScrollView(
              physics: BouncingScrollPhysics(), // Smooth scrolling effect
              padding: EdgeInsets.all(width * 0.052),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.08), // Space for back button

                  // Title Text
                  Container(
                    width: width * 0.9,
                    height: height * 0.035,
                    child: Text(
                      'Abhisree Foundation Documents',
                      style: TextStyle(
                          fontSize: width *
                              0.05, // Increased size for better visibility
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                    ),
                  ),

                  SizedBox(
                      height:
                          width * 0.02), // Space between title & description

                  // Description
                  Text(
                    'Download the joining confirmation, offer letter, ID card, and visiting card required to volunteer at Abhisree Foundation.',
                    style: TextStyle(
                        fontSize: width * 0.03,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF6F6B6B)),
                  ),

                  SizedBox(height: height * 0.045),

                  _buildDocumentCard('Joining Confirmation Letter', width),
                  _buildDocumentCard('NDA', width),
                  _buildDocumentCard('ID Card', width),
                  _buildDocumentCard('Visiting Card', width),
                ],
              ),
            ),
          ],
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
              width: width * 0.5, // Adjust width dynamically
              height: width * 0.04,
              child: Text(
                documentName.toUpperCase(), // Convert text to uppercase
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.034,
                  height: 16 / 14, // Equivalent to line-height: 16px;
                  letterSpacing: 0,
                  color: Colors.black, // Text color
                ),
              ),
            ),
            Image.asset("assets/icons/download_icon.png",
                color: Color(0XFF338D9B)),
          ],
        ),
        SizedBox(height: width * 0.02), // Space between title and card

        // Custom Card Below the Text
        CustomCard(),
        SizedBox(height: width * 0.04), // Space between document sections
      ],
    );
  }
}
