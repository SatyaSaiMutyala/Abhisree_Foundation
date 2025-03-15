import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title; // Optional title parameter
  final VoidCallback? onMenuPressed;
  final VoidCallback? onNotificationPressed;

  const CustomAppBar({
    Key? key,
    this.title = "", // Default to empty if no title is provided
    this.onMenuPressed,
    this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 223,
      decoration: BoxDecoration(
        color: Color(0XFF97D7E0),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          // Menu Button
          Positioned(
            top: 59,
            left: 24,
            child: Container(
              width: 40,
              height: 41,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: onMenuPressed ?? () {},
              ),
            ),
          ),

          // Notification Button
          Positioned(
            top: 59,
            right: 24,
            child: Container(
              width: 40,
              height: 41,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(Icons.notifications_none, color: Colors.black),
                onPressed: onNotificationPressed ?? () {},
              ),
            ),
          ),

          // Search Bar
          Positioned(
            top: 127,
            left: 24,
            right: 24,
            child: Container(
              height: 47,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          // Optional Title (if provided)
          if (title.isNotEmpty)
            Positioned(
              top: 100,
              left: 24,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
