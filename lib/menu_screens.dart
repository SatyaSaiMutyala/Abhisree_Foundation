import 'dart:convert';

import 'package:adhisree_foundation/bottomNav/controller/bottom_navbar_controller.dart';
import 'package:adhisree_foundation/teams/customer_support_screen.dart';
import 'package:adhisree_foundation/utils/constants.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:adhisree_foundation/widgets/logout_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottomNav/bottom_nav_bar.dart';
import 'loginScreen/loginWithNumberScreen.dart';
import 'more_section/profile_screen.dart';
import 'utils/storageService.dart';
import 'widgets/privacy_policy_screen.dart';
import 'widgets/terms_conditions_screen.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int? userId;
  String? name;
  String? email;
  String? image;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

   Future<void> clearUserData() async {
    final storageService = StorageService();
    await storageService.clearUserData();

    Get.offAll(() => Loginwithnumberscreen());
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userData = jsonDecode(userJson);
      setState(() {
        userId = userData['id'];
        name = userData['first_name'];
        email = userData['email'];
        image = userData['photo_path'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.053, top: height * 0.096),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section

            GestureDetector(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()))
              },
              child: Container(
                width: width * 0.68,
                height: height * 0.06,
                // padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                child: Row(
                  children: [
                    // Profile Image
                    Container(
                      width: width * 0.12,
                      height: height * 0.061,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: image != null && image!.isNotEmpty
                            ? Image.network(
                                '${imagePath}${image}',
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/images/Png/user.png",
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),

                    SizedBox(width: width * 0.025),

                    // Name & Email
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // width: width * 0.4,
                            // height: height * 0.026,
                            child: Text(
                              name ?? "No Name",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.035,
                                // height: 1.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            // width: width * 0.4,
                            // height: height * 0.014,
                            child: Text(
                              email ?? "example@gmail.com",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.025,
                                // height: 1.0,
                                color: Color(0xFF6F6B6B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Spacer(),

                    // Arrow Icon
                    Container(
                      width: width * 0.05,
                      height: height * 0.025,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 11,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.025),

            // Menu Items using ListTile
            ListTile(
              leading: Image.asset(
                "assets/icons/teams_color_icon.png",
                width: width * 0.05,
                height: height * 0.026,
                fit: BoxFit.contain,
              ),
              title: Text(
                "Teams",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "You can view your team members here",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 1.0,
                  color: Color(0xFF6F6B6B),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<BottomNavController>().changePage(BnbItem.teams);

                // Navigator.of(context).pop();
                // Get.offAll(() => BottomNavScreen(initialPageIndex: 1));
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                "assets/icons/refer_color_icon.png",
                width: width * 0.05,
                height: height * 0.026,
                fit: BoxFit.contain,
              ),
              title: Text(
                "Refer",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "You can view your referral earnings",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 1.0,
                  color: Color(0xFF6F6B6B),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<BottomNavController>().changePage(BnbItem.referrals);
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                "assets/icons/wallet_color_icon.png",
                width: width * 0.05,
                height: height * 0.026,
                fit: BoxFit.contain,
              ),
              title: Text(
                "Wallet",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "You can withdraw your wallet amount",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 1.0,
                  color: Color(0xFF6F6B6B),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<BottomNavController>().changePage(BnbItem.wallet);
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                "assets/icons/customer_icon.png",
                width: width * 0.05,
                height: height * 0.026,
                fit: BoxFit.contain,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Customer Support",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6), 
                  Text(
                    "You can solve your issues through sending emails and contact through calls",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1.0,
                      color: Color(0xFF6F6B6B),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerSupportScreen()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.description,
                  color: Colors.blue), 
              title: Text(
                "Terms & Conditions",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "Read our terms and conditions",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF6F6B6B),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsConditionsScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.privacy_tip,
                  color: Colors.green), // Replace with your own icon if needed
              title: Text(
                "Privacy Policy",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "Check how your data is handled",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF6F6B6B),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen()),
                );
              },
            ),

            Divider(),
            ListTile(
              leading: Image.asset(
                "assets/icons/logout_icon.png",
                width: width * 0.05,
                height: height * 0.026,
                fit: BoxFit.contain,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "You can exit from this account",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 1.0,
                  color: Color(0xFF6F6B6B),
                ),
              ),
              onTap: () {
                showCustomPopup(
                  context: context,
                  iconPath: "assets/icons/logout_icon.png",
                  message: "Are you sure you want to Logout?",
                  buttonText: "Logout",
                  onConfirm: () {
                    clearUserData();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
