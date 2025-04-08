import 'dart:io';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';

class UploadCard extends StatelessWidget {
  final String title;
  final File? image;

  UploadCard({required this.title, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.9,
      height: height * 0.158,
      decoration: BoxDecoration(
        color: Color(0XFFE4E4E4),
        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
        border: Border.all(color: Color(0XFFE4E4E4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
        child: image != null
            ? Image.file(
                image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
            : Padding(
                padding: EdgeInsets.all(Dimensions.radiusLarge),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/drive_icon.png",
                      color: Color(0XFF338D9B),
                      height: height * 0.06,
                      width: width * 0.15,
                    ),
                    // SizedBox(height: 8),
                    Text("PNG, JPG",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.028,
                          color: Color(0XFF2A2B2D),
                        )),
                    // SizedBox(height: 8),
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.034,
                        color: Color(0XFF2A2B2D),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
