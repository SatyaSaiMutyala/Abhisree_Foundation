import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> todayNotifications = [
    {
      "image": "assets/slider1.png",
      "title": "Students Education Campaigns",
      "subtitle":
          "Supporting Below Poverty Level (BPL) students can make a significant impact on their education and future.",
    },
    {
      "image": "assets/slider1.png",
      "title": "Students Education Campaigns",
      "subtitle":
          "Supporting Below Poverty Level (BPL) students can make a significant impact on their education and future.",
    },
  ];

  final List<Map<String, String>> yesterdayNotifications = [
    {
      "image": "assets/teams1.png",
      "title": "Educational Support Program",
      "subtitle":
          "Providing scholarships and resources helps shape a better future for underprivileged students.",
    },
    {
      "image": "assets/teams1.png",
      "title": "Educational Support Program",
      "subtitle":
          "Providing scholarships and resources helps shape a better future for underprivileged students.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21, vertical: 20),
        child: ListView(
          children: [
            _buildSectionTitle("Today"),
            ..._buildNotificationList(todayNotifications),
            _buildSectionTitle("Most recent"),
            ..._buildNotificationList(yesterdayNotifications),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<Widget> _buildNotificationList(List<Map<String, String>> notifications) {
    List<Widget> widgets = [];
    for (var i = 0; i < notifications.length; i++) {
      widgets.add(_buildNotificationItem(
        notifications[i]["image"]!,
        notifications[i]["title"]!,
        notifications[i]["subtitle"]!,
      ));
      if (i != notifications.length - 1) {
        widgets.add(Divider()); // Add divider after each notification
      }
    }
    return widgets;
  }

  Widget _buildNotificationItem(String imagePath, String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF6F6B6B),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
