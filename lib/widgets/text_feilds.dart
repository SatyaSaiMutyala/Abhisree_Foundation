import 'package:flutter/material.dart';

Widget textFieldScreen(
  String labelText, {
  TextInputType keyboardType = TextInputType.text,
  String hintText = "",
}) {
  return LayoutBuilder(builder: (context, constraints) {
    double screenWidth = constraints.maxWidth; 
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Text(
            labelText.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: width * 0.03,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
        Container(
          padding: EdgeInsets.symmetric(vertical: width * 0.01, horizontal: width * 0.03),
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
