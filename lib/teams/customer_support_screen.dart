import 'package:flutter/material.dart';

class CustomerSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Customer Support")),
      body: Stack(
        children: [
          Positioned(
            top: 272, // 272px from the top
            left: 115, // 115px from the left
            child: Column(
              children: [
                _buildSupportCard(Icons.phone, "Contact Us"),
                SizedBox(height: 40), // Gap of 10px
                _buildSupportCard(Icons.call, "WhatsApp"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each support card
  Widget _buildSupportCard(IconData icon, String text) {
    return Container(
      width: 165,
      height: 122,
      padding: EdgeInsets.fromLTRB(31, 19, 31, 19), // Padding as specified
      decoration: BoxDecoration(
        color: Color(0xFFDAF6FA), // Background Color (Blue-100)
        borderRadius: BorderRadius.circular(12), // Large border-radius
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blue), // Icon
          SizedBox(height: 10), // Space between icon and text
          Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Text
        ],
      ),
    );
  }
}
