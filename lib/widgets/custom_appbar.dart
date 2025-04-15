// import 'package:adhisree_foundation/menu_screens.dart';
// import 'package:adhisree_foundation/notification_screen.dart';
// import 'package:adhisree_foundation/utils/dimensions.dart';
// import 'package:adhisree_foundation/utils/routes.dart';
// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget {
//   final String title;
//   final VoidCallback? onMenuPressed;
//   final VoidCallback? onNotificationPressed;

//   const CustomAppBar({
//     Key? key,
//     this.title = "",
//     this.onMenuPressed,
//     this.onNotificationPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Container(
//       height: height * 0.255,
//       decoration: BoxDecoration(
//         color: Color(0XFF97D7E0),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(Dimensions.radiusDoubleExtraLarge),
//           bottomRight: Radius.circular(Dimensions.radiusDoubleExtraLarge),
//         ),
//       ),
//       child: Stack(
//         children: [
//           // Menu Button
//           // Menu Button
//           Positioned(
//             top: height * 0.068,
//             left: width * 0.055,
//             child: IconButton(
//               iconSize: width * 0.1125, // Increase the icon size
//               padding: EdgeInsets.zero, // Remove extra padding
//               icon: SizedBox(
//                 width: width * 0.1125, // Adjust width
//                 height: height * 0.058, // Adjust height
//                 child: Image.asset('assets/icons/menu_icon.png'),
//               ),
//               onPressed: onMenuPressed ?? () => showMenuDialog(context),
//             ),
//           ),

// // Notification Button
//           Positioned(
//             top: height * 0.068,
//             right: width * 0.055,
//             child: IconButton(
//               iconSize: width * 0.1125, // Increase the icon size
//               padding: EdgeInsets.zero, // Remove extra padding
//               icon: SizedBox(
//                 width: width * 0.1125, // Adjust width
//                 height: height * 0.058, // Adjust height
//                 child: Image.asset('assets/icons/notification_icon.png'),
//               ),
//               onPressed: onNotificationPressed ??
//                   () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => NotificationsScreen()),
//                     );
//                   },
//             ),
//           ),

//           // Search Bar
//           Positioned(
//             top: height * 0.146,
//             left: width * 0.055,
//             right: width * 0.055,
//             child: Container(
//               height: height * 0.055,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.circular(Dimensions.radiusDefaultExpand),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 4,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),

//               child: Stack(
//                 children: [
//                   TextField(
//                     enabled: false,
//                     textAlignVertical: TextAlignVertical.center,
//                     decoration: InputDecoration(
//                       hintText: "Search...",
//                       prefixIcon: Container(
//                         width: 12,
//                         height: 12,
//                         padding: EdgeInsets.all(width * 0.034),
//                         child: Image.asset(
//                           "assets/icons/search_icon.png",
//                           color: Colors.black,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                   Positioned.fill(
//                     child: InkWell(
//                       onTap: () =>
//                           Navigator.pushNamed(context, AppRoutes.searchScreen),
//                       splashColor:
//                           Colors.transparent,
//                       highlightColor: Colors.transparent,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Optional Title (if provided)
//           if (title.isNotEmpty)
//             Positioned(
//               top: 100,
//               left: 24,
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   void showMenuDialog(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//       transitionDuration: Duration(milliseconds: 300),
//       pageBuilder: (context, anim1, anim2) {
//         return Align(
//           alignment: Alignment.centerLeft,
//           child: Material(
//             color: Colors.transparent,
//             child: SizedBox(
//               width: width * 0.81, // Custom width
//               height: height, // Custom height
//               child: MenuScreen(), // Ensure MenuScreen is being used
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (context, anim1, anim2, child) {
//         return SlideTransition(
//           position: Tween<Offset>(
//             begin: Offset(-1, 0), // Start from left
//             end: Offset(0, 0), // End at center
//           ).animate(anim1),
//           child: child,
//         );
//       },
//     );
//   }
// }

import 'package:adhisree_foundation/menu_screens.dart';
import 'package:adhisree_foundation/notification_screen.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onNotificationPressed;
  final String screenType;
  final Function(DateTime)? onStartDateChanged;
  final Function(DateTime)? onEndDateChanged;
  final Function(String)? onReferralSearchChanged;
  final String? startDate;
  final String? endDate;
  final VoidCallback? onClearDates;

  const CustomAppBar({
    Key? key,
    this.title = "",
    this.onMenuPressed,
    this.onNotificationPressed,
    required this.screenType,
    this.onStartDateChanged,
    this.onEndDateChanged,
    this.onReferralSearchChanged,
    this.startDate,
    this.endDate,
    this.onClearDates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.255,
      decoration: BoxDecoration(
        color: const Color(0XFF97D7E0),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimensions.radiusDoubleExtraLarge),
          bottomRight: Radius.circular(Dimensions.radiusDoubleExtraLarge),
        ),
      ),
      child: Stack(
        children: [
          // Menu Button
          Positioned(
            top: height * 0.068,
            left: width * 0.055,
            child: IconButton(
              iconSize: width * 0.1125,
              padding: EdgeInsets.zero,
              icon: SizedBox(
                width: width * 0.1125,
                height: height * 0.058,
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
              iconSize: width * 0.1125,
              padding: EdgeInsets.zero,
              icon: SizedBox(
                width: width * 0.1125,
                height: height * 0.058,
                child: Image.asset('assets/icons/notification_icon.png'),
              ),
              onPressed: onNotificationPressed ??
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NotificationsScreen()),
                    );
                  },
            ),
          ),

          // Search / Filters based on screen type
          Positioned(
            top: height * 0.146,
            left: width * 0.055,
            right: width * 0.055,
            child: Builder(
              builder: (context) {
                if (screenType == 'wallet') {
                  return Row(
                    children: [
                      // Start Date Picker
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              onStartDateChanged?.call(picked);
                            }
                          },
                          child: Container(
                            height: height * 0.055,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              startDate ?? "Start Date",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: width * 0.038,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 8),

                      // End Date Picker
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              onEndDateChanged?.call(picked);
                            }
                          },
                          child: Container(
                            height: height * 0.055,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              endDate ?? "End Date",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: width * 0.038,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 8),

                      // Clear Button
                      GestureDetector(
                        onTap: onClearDates,
                        child: Container(
                          height: height * 0.055,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.refresh, 
                            color: Colors.white,
                            size: width * 0.05,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (screenType == 'referral') {
                  return Container(
                    height: height * 0.055,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: onReferralSearchChanged,
                        style: TextStyle(fontSize: width * 0.04),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: height * 0.014),
                          border: InputBorder.none,
                          hintText: "Search by name...",
                          hintStyle: TextStyle(fontSize: width * 0.04),
                          icon: Icon(Icons.search,
                              size: width * 0.06, color: Colors.black54),
                        ),
                      ),
                    ),
                  );
                } else {
                  // default (home)
                  return Container(
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefaultExpand),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        TextField(
                          enabled: false,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: width * 0.04),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding:
                                EdgeInsets.symmetric(vertical: height * 0.014),
                            hintText: "Search...",
                            hintStyle: TextStyle(fontSize: width * 0.04),
                            prefixIcon: Icon(Icons.search,
                                color: Colors.black, size: width * 0.06),
                            border: InputBorder.none,
                          ),
                        ),
                        Positioned.fill(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, AppRoutes.searchScreen),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),

          // Optional Title
          if (title.isNotEmpty)
            Positioned(
              top: 100,
              left: 24,
              child: Text(
                title,
                style: const TextStyle(
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              width: width * 0.81,
              height: height,
              child: MenuScreen(),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }
}
