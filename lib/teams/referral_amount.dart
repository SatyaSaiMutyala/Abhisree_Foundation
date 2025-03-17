import 'package:flutter/material.dart';

class ReferralAmountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width -
                  46,
        height: 131,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xFFDAF6FA), // Background color
          borderRadius: BorderRadius.circular(21.18), // Border radius
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
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "₹500.00",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
