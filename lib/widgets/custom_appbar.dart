import 'package:adhisree_foundation/menu_screens.dart';
import 'package:adhisree_foundation/notification_screen.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
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
          bottomLeft: Radius.circular(Dimensions.radiusDoubleExtraLarge),
          bottomRight: Radius.circular(Dimensions.radiusDoubleExtraLarge),
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
                icon: Image.asset(
  'assets/icons/menu_icon.png',
),
                onPressed: onMenuPressed ?? () => showMenuDialog(context),
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
                icon: Image.asset('assets/icons/notification_icon.png',),
                onPressed: onNotificationPressed ??
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationsScreen()),
                      );
                    },
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

  void showMenuDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: Duration(milliseconds: 300), // Smooth animation
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              width: 333, // Custom width
              height: 852, // Custom height
              child: MenuScreen(), // Ensure MenuScreen is being used
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-1, 0), // Start from left
            end: Offset(0, 0), // End at center
          ).animate(anim1),
          child: child,
        );
      },
    );
  }
}
