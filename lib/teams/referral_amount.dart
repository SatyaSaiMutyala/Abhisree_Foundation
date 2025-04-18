import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ReferralAmountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width -
                  width * 0.1,
        height: 131,
        padding: EdgeInsets.symmetric(horizontal: width * 0.040, vertical: width * 0.05),
        decoration: BoxDecoration(
          color: Color(0xFFDAF6FA), // Background color
          borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge), // Border radius
          boxShadow: [
            BoxShadow(
              color: Color(0x171A1F12), // First shadow
              blurRadius: 1,
            ),
            BoxShadow(
              color: Color(0x171A1F1F), // Second shadow
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Referrals earnings",
              style: TextStyle(
                fontSize: Dimensions.fontSizeLarge,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(height: width * 0.02),
            Text(
              "₹120",
              style: TextStyle(
                fontSize: Dimensions.fontSizeMoreLarge,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
