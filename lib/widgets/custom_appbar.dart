import 'package:adhisree_foundation/menu_screens.dart';
import 'package:adhisree_foundation/notification_screen.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onNotificationPressed;

  const CustomAppBar({
    Key? key,
    this.title = "",
    this.onMenuPressed,
    this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.255,
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
          // Menu Button
          Positioned(
            top: height * 0.068,
            left: width * 0.055,
            child: IconButton(
              iconSize: width * 0.1125, // Increase the icon size
              padding: EdgeInsets.zero, // Remove extra padding
              icon: SizedBox(
                width: width * 0.1125, // Adjust width
                height: height * 0.058, // Adjust height
                child: Image.asset('assets/icons/menu_icon.png'),
              ),
              onPressed: onMenuPressed ?? () => showMenuDialog(context),
            ),
          ),

// Notification Button
          Positioned(
            top: height * 0.068,
            right: width * 0.055,
            child: IconButton(
              iconSize: width * 0.1125, // Increase the icon size
              padding: EdgeInsets.zero, // Remove extra padding
              icon: SizedBox(
                width: width * 0.1125, // Adjust width
                height: height * 0.058, // Adjust height
                child: Image.asset('assets/icons/notification_icon.png'),
              ),
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

          // Search Bar
          Positioned(
            top: height * 0.146,
            left: width * 0.055,
            right: width * 0.055,
            child: Container(
              height: height * 0.055,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radiusDefaultExpand),
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
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Container(
                      width: 12,
                      height: 12,
                      padding: EdgeInsets.all(width *
                          0.034), // Adjust padding to fine-tune the size
                      child: Image.asset(
                        "assets/icons/search_icon.png",
                        color: Colors.black,
                        fit: BoxFit
                            .contain, // Ensures the image fits inside the container
                      ),
                    ),
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
    double width = MediaQuery.of(context).size.width; // Define width here
  double height = MediaQuery.of(context).size.height;
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
              width: width * 0.81, // Custom width
              height: height, // Custom height
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
