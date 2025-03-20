import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomerSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: height * 0.07,
            left: width * 0.35, // Centered dynamically
            child: Container(
              width: width * 0.41,
              height: height * 0.04,
              alignment: Alignment.center,
              child: Text(
                "Customer Support",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.fontSizeExtraLarge,
                  height: 33 / 16, // Line-height equivalent
                  letterSpacing: 0,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Positioned Back Button
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
          Positioned(
            top: height * 0.32, // 272px from the top
            left: width * 0.28, // 115px from the left
            child: Column(
              children: [
                _buildSupportCard(width, "assets/icons/call_icon.png", "Contact Us"),
                SizedBox(height: height * 0.046), // Gap of 40px
                _buildSupportCard(width, "assets/icons/whatsapp_icon.png", "WhatsApp"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each support card
  Widget _buildSupportCard(double width, String iconPath, String text) {
    return Container(
      width: width * 0.4,  // Use the passed width
      height: width * 0.3,
      padding: EdgeInsets.fromLTRB(width * 0.076, width * 0.049, width * 0.076, width * 0.049), // Padding as specified
      decoration: BoxDecoration(
        color: Color(0xFFDAF6FA), // Background Color (Blue-100)
        borderRadius: BorderRadius.circular(Dimensions.radiusDefaultExpand), // Large border-radius
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: width * 0.12,
            height: width * 0.12,
            fit: BoxFit.contain,
          ), // Display the asset image
          SizedBox(height: width * 0.024), // Space between icon and text
          Text(
            text,
            style: TextStyle(fontSize: width * 0.038, fontWeight: FontWeight.bold),
          ), // Text
        ],
      ),
    );
  }
}
