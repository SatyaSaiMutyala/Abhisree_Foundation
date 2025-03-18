import 'package:flutter/material.dart';

Widget textFieldScreen(
  String labelText, {
  TextInputType keyboardType = TextInputType.text,
  String hintText = "",
}) {
  return LayoutBuilder(builder: (context, constraints) {
    double screenWidth = constraints.maxWidth; // Get available width dynamically

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWidth, // Use full width available
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            labelText.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 10.61,
              letterSpacing: 0.76,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 6.06),
        Container(
          width: screenWidth, // Use full width available
          height: 40,
          padding: EdgeInsets.symmetric(vertical: 4.55, horizontal: 10.61),
          decoration: BoxDecoration(
            color: Color(0xFFE4E4E4),
            borderRadius: BorderRadius.circular(6.06),
          ),
          child: TextField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText.isNotEmpty ? hintText : "Enter $labelText",
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  });
}
