import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final double width;
  final double height;

  const CustomHeader({
    Key? key,
    required this.title,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Title Text
        Positioned(
          top: height * 0.3, // Adjusted for better positioning
          left: width * 1, // Center dynamically
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.fontSizeExtraLarge,
                height: 33 / 16,
                letterSpacing: 0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        //   Positioned(
        //     top: height * 0.07,
        //     left: width * 0.35, // Centered dynamically
        //     child: Container(
        //       width: width * 0.3,
        //       height: height * 0.04,
        //       alignment: Alignment.center,
        //       child: Text(
        //         "Bank Details",
        //         style: TextStyle(
        //           fontFamily: "Inter",
        //           fontWeight: FontWeight.w600,
        //           fontSize: Dimensions.fontSizeExtraLarge,
        //           height: 33 / 16, // Line-height equivalent
        //           letterSpacing: 0,
        //           color: Colors.black,
        //         ),
        //       ),
        //     ),
        //   ),

      ],
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  final double width;
  final double height;

  const BackButtonWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 1.625,
      left: width * 0.05,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: width * 0.1,
          height: height * 2.5,
          padding: const EdgeInsets.fromLTRB(8, 7, 8, 7),
          decoration: const BoxDecoration(
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
    );
  }
}