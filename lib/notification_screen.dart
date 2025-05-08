import 'dart:convert';

import 'package:adhisree_foundation/controllers/GetNotifiactionsController.dart';
import 'package:adhisree_foundation/controllers/UnseenNotificationController.dart';
import 'package:adhisree_foundation/models/NotificationModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/NotificationCountController.dart';
import 'widgets/FullNotificationScreen.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationScreen> {
  final GetNotificationController getNotificationController =
      Get.put(GetNotificationController());
  final UnseenNotificationController unseenNotificationController =
      Get.put(UnseenNotificationController());
  final Notificationcountcontroller notificationcountcontroller =
      Get.put(Notificationcountcontroller());
  String? userId;

  Set<int> expandedItems = {}; // To track which notifications are expanded

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userData = jsonDecode(userJson);
      setState(() {
        userId = userData['id'].toString();
      });
      getNotificationController.fetchNotifications(
          'get-all-notification-list/get', userId.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (getNotificationController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        var notifications = getNotificationController.notifications;
        var newNotifications =
            notifications.where((n) => n.userSeen == 0).toList();
        var recentNotifications =
            notifications.where((n) => n.userSeen == 1).toList();

        if (newNotifications.isEmpty && recentNotifications.isEmpty) {
          return Center(
            child: Text(
              "No notifications available",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.051, vertical: height * 0.026),
          child: RefreshIndicator(
            onRefresh: () async {
              getNotificationController.fetchNotifications(
                  'get-all-notification-list/get', userId.toString());
            },
            child: ListView(
              children: [
                if (newNotifications.isNotEmpty) ...[
                  _buildSectionTitle("New Notifications", height),
                  ..._buildNotificationList(newNotifications, width, height,
                      isNew: true),
                ],
                if (recentNotifications.isNotEmpty) ...[
                  _buildSectionTitle("Recent Notifications", height),
                  ..._buildNotificationList(recentNotifications, width, height),
                ],
              ],
            ),
          ),
        );
      }),
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

  List<Widget> _buildNotificationList(
    List<NotificationModel> notifications,
    double width,
    double height, {
    bool isNew = false,
  }) {
    List<Widget> widgets = [];
    for (var i = 0; i < notifications.length; i++) {
      widgets.add(_buildNotificationItem(
        notifications[i].imageUrl,
        notifications[i].title,
        notifications[i].description,
        notifications[i].notificationId,
        width,
        height,
        isNew: isNew,
      ));
      if (i != notifications.length - 1) {
        widgets.add(Divider());
      }
    }
    return widgets;
  }

  Widget _buildNotificationItem(
    String imagePath,
    String title,
    String subtitle,
    int id,
    double width,
    double height, {
    bool isNew = false,
  }) {
    final isExpanded = expandedItems.contains(id);

    return GestureDetector(
      onTap: () async {
        setState(() {
          if (isExpanded) {
            expandedItems.remove(id);
          } else {
            expandedItems.add(id);
          }
        });

        if (isNew) {
          await unseenNotificationController
              .postUnseenNotification(id.toString());
          await getNotificationController.fetchNotifications(
              'get-all-notification-list/get', userId.toString());
          await notificationcountcontroller.fetchCount(userId.toString());
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FullNotificationScreen(
              imageUrl: imagePath,
              title: title,
              description: subtitle,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.008),
        decoration: BoxDecoration(
          color: isNew ? Color(0xFFE8F0FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: width * 0.15,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    image: DecorationImage(
                      image: NetworkImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (isNew)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.04,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.035,
                      color: Color(0xFF6F6B6B),
                    ),
                    maxLines: isExpanded ? null : 2,
                    overflow: isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
