import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/teams/customer_support_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 21, top: 82), // Aligns Profile Section
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Container(
              width: 275,
              height: 52,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  // Profile Image
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9), // Grey placeholder color
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/teams1.png", // Change to NetworkImage if needed
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  // Name & Email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 143,
                        height: 21,
                        child: Text(
                          "Prasanth Varma",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.0, // 100% line-height
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 144,
                        height: 12,
                        child: Text(
                          "Prasanthvarma23@gmail.com",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            height: 1.0, // 100% line-height
                            color: Color(0xFF6F6B6B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),

                  // Arrow Icon
                  Container(
                    width: 16,
                    height: 16,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 11, // Adjusted to match given size
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20), // Spacing before menu items

            // Menu Items using ListTile
            ListTile(
              leading: Image.asset(
                "assets/teams_icon.png",
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              title: Text("Teams"),
              subtitle: Text("You can view your team members here"),
              onTap: () {
                  Get.to(() => BottomNavScreen(initialPageIndex: 0));
                },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                "assets/refer_icon.png",
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              title: Text("Refer"),
              subtitle: Text("You can view your referral earnings"),
              onTap: () {
                  Get.to(() => BottomNavScreen(initialPageIndex: 3));
                },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                "assets/wallet_icon.png",
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              title: Text("Wallet"),
              subtitle: Text("You can withdraw your wallet amount"),
              onTap: () {
                  Get.to(() => BottomNavScreen(initialPageIndex: 2));
                },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                "assets/customer_icon.png",
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              title: Text("Customer Support"),
              subtitle: Text("You can solve your issues through sending emails and contact through calls"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerSupportScreen()));
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                "assets/logout_icon.png",
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text("You can exit from this account"),
              onTap: () {
                // Handle Logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
