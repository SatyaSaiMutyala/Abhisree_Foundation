import 'package:flutter/material.dart';

class DonationCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;

    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.07),
            child: Text(
              "Donation Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.05,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),

          // Education Category Card
          Padding(
            padding: EdgeInsets.only(left: width * 0.07),
            child: Container(
              width: width * 0.3,
              height: height * 0.13,
              padding: EdgeInsets.symmetric(
                vertical: width * 0.02,
                horizontal: width * 0.02,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular( width * 0.02),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school, 
                    size: width * 0.1, 
                    color: Colors.black
                  ),
                  SizedBox(height: height * 0.007),
                  Text(
                    "Education",
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).shadowColor.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
    );
  }
}
