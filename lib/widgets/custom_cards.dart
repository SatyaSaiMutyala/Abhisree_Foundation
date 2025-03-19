import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.9,
      height: height * 0.158,
      decoration: BoxDecoration(
        color: Color(0xFFD5D6DA),
        borderRadius: BorderRadius.circular(Dimensions.radiusLarge), // Large corner radius
      ),
    );
  }
}

class UploadCard extends StatelessWidget {
  final String title; // Accept text as a parameter

  UploadCard(this.title); // Constructor to receive text

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.9,
      height: height * 0.158,
      padding: EdgeInsets.all(Dimensions.radiusLarge),
      decoration: BoxDecoration(
        color: Color(0XFFE4E4E4),
        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
        border: Border.all(color: Color(0XFFE4E4E4)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/drive_icon.png", color: Color(0XFF338D9B)),
          SizedBox(height: 8),
          Text("PNG, JPNG", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, fontSize: width * 0.028, color: Color(0XFF2A2B2D))),
          SizedBox(height: 8),
          Text(
            title, // Use the passed text here
            style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: width * 0.034, color: Color(0XFF2A2B2D)),
          ),
        ],
      ),
    );
  }
}