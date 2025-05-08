import 'dart:convert';

import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/controllers/UserDetailsController.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuccessScreens extends StatefulWidget {
  final String role;
  const SuccessScreens({Key? key, required this.role}) : super(key: key);
  @override
  _SuccessScreensState createState() => _SuccessScreensState();
}

class _SuccessScreensState extends State<SuccessScreens> {
  final UserProgressController userProgressController =
      Get.put(UserProgressController());
  String? userId;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    String? storedRole = prefs.getString('role');
    if (userJson != null && storedRole != null) {
      Map<String, dynamic> userData = jsonDecode(userJson);
      setState(() {
        userId = userData['id'].toString();
      });
      userProgressController.fetchUserProgress(userId.toString());
      final user = userProgressController.userProgress.value;
      final userRole = user!.userType;
      await prefs.setString('role', userRole);
    print("CHANDED ROLE ******${userRole}");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Png/success_icon.png",
              color: Colors.green,
            ),
            SizedBox(height: height * 0.025),
            Text(
              "Congratulations! You are now an ${widget.role} at Abhisree Foundation 🎉",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.058,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.018, horizontal: width * 0.07),
              child: CustomButton(
                  text: 'Back To Home',
                  onPressed: () =>
                      Get.offAll(() => BottomNavScreen(initialPageIndex: 0))),
            ),
          ],
        ),
      ),
    );
  }
}
