import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> todayNotifications = [
    {
      "image": "assets/images/Png/slider1.png",
      "title": "Students Education Campaigns",
      "subtitle":
          "Supporting Below Poverty Level (BPL) students can make a significant impact on their education and future.",
    },
    {
      "image": "assets/images/Png/slider1.png",
      "title": "Students Education Campaigns",
      "subtitle":
          "Supporting Below Poverty Level (BPL) students can make a significant impact on their education and future.",
    },
  ];

  final List<Map<String, String>> yesterdayNotifications = [
    {
      "image": "assets/images/Png/teams1.png",
      "title": "Educational Support Program",
      "subtitle":
          "Providing scholarships and resources helps shape a better future for underprivileged students.",
    },
    {
      "image": "assets/images/Png/teams1.png",
      "title": "Educational Support Program",
      "subtitle":
          "Providing scholarships and resources helps shape a better future for underprivileged students.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.051, vertical: height * 0.026),
        child: ListView(
          children: [
            _buildSectionTitle("Today", height),
            ..._buildNotificationList(todayNotifications, width, height), // ✅ Pass width & height
            _buildSectionTitle("Most recent", height),
            ..._buildNotificationList(yesterdayNotifications, width, height), // ✅ Pass width & height
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.012),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<Widget> _buildNotificationList(List<Map<String, String>> notifications, double width, double height) {
    List<Widget> widgets = [];
    for (var i = 0; i < notifications.length; i++) {
      widgets.add(_buildNotificationItem(
        notifications[i]["image"]!,
        notifications[i]["title"]!,
        notifications[i]["subtitle"]!,
        width,  // ✅ Pass width
        height, // ✅ Pass height
      ));
      if (i != notifications.length - 1) {
        widgets.add(Divider()); // Add divider after each notification
      }
    }
    return widgets;
  }

  Widget _buildNotificationItem(String imagePath, String title, String subtitle, double width, double height) { // ✅ Receive width & height
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.008), // ✅ Use height safely
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.15, // ✅ Use width safely
            height: height * 0.07, // ✅ Use height safely
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: width * 0.03), // ✅ Use width safely
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.04, // ✅ Responsive text size
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: height * 0.005), // ✅ Use height safely
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.035, // ✅ Responsive text size
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
