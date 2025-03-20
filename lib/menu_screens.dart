import 'package:adhisree_foundation/bottomNav/controller/bottom_navbar_controller.dart';
import 'package:adhisree_foundation/teams/customer_support_screen.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/widgets/logout_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends StatelessWidget {
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
            Container(
              width: width * 0.68,
              height: height * 0.06,
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
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
                      child: Image.asset(
                        "assets/images/Png/teams1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.025),

                  // Name & Email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        height: height * 0.026,
                        child: Text(
                          "Prasanth Varma",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: Dimensions.fontSizeDefault,
                            height: 1.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.4,
                        height: height * 0.014,
                        child: Text(
                          "Prasanthvarma23@gmail.com",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.025,
                            height: 1.0,
                            color: Color(0xFF6F6B6B),
                          ),
                        ),
                      ),
                    ],
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

            SizedBox(height: height * 0.025),

            // Menu Items using ListTile
            ListTile(
              leading: Image.asset(
                "assets/icons/teams_color_icon.png",
                width: width * 0.05,
                height: height * 0.026,
                fit: BoxFit.contain,
              ),
              title: Text("Teams"),
              subtitle: Text("You can view your team members here"),
              onTap: () {
  Get.find<BottomNavController>().changePage(BnbItem.teams);
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
              title: Text("Refer"),
              subtitle: Text("You can view your referral earnings"),
              onTap: () {
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
              title: Text("Wallet"),
              subtitle: Text("You can withdraw your wallet amount"),
              onTap: () {
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
              title: Text("Customer Support"),
              subtitle: Text(
                  "You can solve your issues through sending emails and contact through calls"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerSupportScreen()));
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
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text("You can exit from this account"),
              onTap: () {
                showCustomPopup(
                  context: context,
                  iconPath: "assets/icons/logout_icon.png",
                  message: "Are you sure you want to Logout?",
                  buttonText: "Logout",
                  onConfirm: () {
                    // Perform logout action
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
