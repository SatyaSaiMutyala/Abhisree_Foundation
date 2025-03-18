import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';

class DonationPopupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Popup Container
          Container(
            width: 341,
            height: 409,
            padding: EdgeInsets.all(24.26),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),

                // Title
                Container(
                  width: 234.24,
                  height: 26,
                  alignment: Alignment.center,
                  child: Text(
                    "ADD DETAILS TO RECEIVE RECEIPT",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 15.16,
                      height: 25.02 / 15.16,
                      letterSpacing: 0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 18.95),

                // Name Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldScreen("Name", keyboardType: TextInputType.number),
                  ],
                ),
                SizedBox(height: 9.1),

                // Email Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldScreen("Pan", keyboardType: TextInputType.number),
                  ],
                ),
                SizedBox(height: 9.1),

                // Donation Amount Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldScreen("Phone Number", keyboardType: TextInputType.number),
                  ],
                ),
                SizedBox(height: 24),

                // Donate Button
                // Donate Button
                // Continue Button
                Center(
                  child: Container(
                    width: 292.48,
                    height: 34.11,
                    decoration: BoxDecoration(
                      color: Color(0xFF338D9B),
                      borderRadius: BorderRadius.circular(6.06),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Keeps the container color
                        shadowColor:
                            Colors.transparent, // Removes button shadow
                        padding: EdgeInsets.symmetric(
                            vertical: 8.34, horizontal: 116.74),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.06),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10), // Space between buttons

// Skip Button
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Handle skip action
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Removes default padding
                      minimumSize: Size(292.48, 26), // Sets exact size
                      tapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // Prevents extra padding
                    ),
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.13,
                        height: 25.02 / 12.13,
                        letterSpacing: 0,
                        color: Color(0XFF338D9B), // Text color only, no background
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Close Button with Background
          Positioned(
            top: 15.76,
            left: 290.43,
            child: Container(
              width: 31.08,
              height: 29.73,
              decoration: BoxDecoration(
                color: Color(0XFFE4E4E4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.close, size: 16.22, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
