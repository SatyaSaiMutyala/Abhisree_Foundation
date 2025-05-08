// full_notification_screen.dart

import 'package:flutter/material.dart';

class FullNotificationScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const FullNotificationScreen({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl, height: height * 0.25, width: double.infinity, fit: BoxFit.cover),
            ),
            SizedBox(height: height * 0.02),
            Text(
              title,
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.015),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
