// import 'package:adhisree_foundation/homescreen/active_campaigns.dart';
// import 'package:adhisree_foundation/homescreen/donation_categories.dart';
// import 'package:adhisree_foundation/homescreen/slider_screen.dart';
// import 'package:adhisree_foundation/utils/dimensions.dart';
// import 'package:adhisree_foundation/widgets/custom_appbar.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomAppBar(),
//             SizedBox(height: Dimensions.sizedBoxSizeExtrsMedLarge),
//             SliderScreen(),
//             SizedBox(height: Dimensions.sizedBoxSizeExtraMoreLargeplus),
//             DonationCategoryScreen(),
//             SizedBox(height: Dimensions.sizedBoxSizeExtraMoreLargeplus),
//             ActiveCampaigns(),
//             SizedBox(height: 20), // Extra space at the bottom
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:adhisree_foundation/controllers/NotificationCountController.dart';
import 'package:adhisree_foundation/controllers/SendDeviceTokenController.dart';
import 'package:adhisree_foundation/controllers/UserDetailsController.dart';
import 'package:adhisree_foundation/homescreen/active_campaigns.dart';
import 'package:adhisree_foundation/homescreen/donation_categories.dart';
import 'package:adhisree_foundation/homescreen/slider_screen.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/utils/storageService.dart';
import 'package:adhisree_foundation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Key _refreshKey = UniqueKey();

  final storageService = StorageService();
  final SendDeviceTokenController sendDeviceTokenController =
      Get.put(SendDeviceTokenController());

  final UserProgressController userProgressController =
      Get.put(UserProgressController());

  final Notificationcountcontroller notificationcountcontroller =
      Get.put(Notificationcountcontroller());

  int? userId;
  String? fcmToken;
  late int count;

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _refreshKey = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
    sendFcmToken();
  }

  Future<void> sendFcmToken() async {
    // userId = await storageService.getUserId();
    fcmToken = await storageService.getFcmToken();

    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');

    if (userJson != null) {
      Map<String, dynamic> decodedUserData = jsonDecode(userJson);
      userId = decodedUserData['id'];
    }
    print("User ID --------------: $userId");
    print("FCM Token ***: $fcmToken");
    if (userId != null && fcmToken != null) {
      final data = {
        'user_id': userId,
        'fcm_token': fcmToken,
      };
      sendDeviceTokenController.sendFcmToken('store-fcm-token', data);
      await userProgressController.fetchUserProgress(userId.toString());
      await notificationcountcontroller.fetchCount(userId.toString());

      final userDetails = userProgressController.userProgress.value;

      if (userDetails!.status == 0) {
        print('this is status ******** ${userDetails.status}');
        Future.delayed(Duration.zero, () {
          showInactivePopup(context);
        });
      } else {
        setState(() {
          count = notificationcountcontroller.unseenCount.value;
        });
      }
      print('DEVICE TOKEN SEND*******');
      print('COUNT MAN********************$count');
    }
  }

  void showInactivePopup(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    barrierDismissible: false, // Prevent tap outside to close
    builder: (BuildContext dialogContext) {
      return WillPopScope(
        onWillPop: () async {
          // Exit the app if back button is pressed
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
          return false;
        },
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          titlePadding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: width * 0.04,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: width * 0.02,
          ),
          title: Row(
            children: [
              Icon(Icons.block, color: Colors.red, size: width * 0.07),
              SizedBox(width: width * 0.03),
              Expanded(
                child: Text(
                  'Access Denied',
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            'You have been marked inactive by the admin. Please contact the administrator for assistance.',
            style: TextStyle(
              fontSize: width * 0.04,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.04, bottom: width * 0.02),
              child: TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Close dialog
                  Future.delayed(Duration(milliseconds: 300), () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop(); // Android exit
                    } else if (Platform.isIOS) {
                      exit(0); // iOS exit
                    }
                  });
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.045,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          key: _refreshKey,
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomAppBar(screenType: 'home', notificationCount:5),
              Obx(() => CustomAppBar(
                    screenType: 'home',
                    notificationCount:
                        notificationcountcontroller.unseenCount.value,
                  )),

              SizedBox(height: Dimensions.sizedBoxSizeExtrsMedLarge),
              SliderScreen(),
              SizedBox(height: Dimensions.sizedBoxSizeExtraMoreLargeplus),
              DonationCategoryScreen(),
              SizedBox(height: Dimensions.sizedBoxSizeExtraMoreLargeplus),
              ActiveCampaigns(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
