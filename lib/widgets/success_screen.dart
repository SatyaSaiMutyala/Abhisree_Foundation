import 'dart:convert';

import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/homescreen/donation_model/volunteer_membership.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  String? userId;
  String? role;

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
        role = storedRole;
      });

      if (storedRole == 'donor' && mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showSuccessPopup(); 
        });
      }
    }
  }

  void _showSuccessPopup() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
          ),
          child: Container(
            width: width * 0.9,
            height: height * 0.4,
            padding: EdgeInsets.all(width * 0.06),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Png/Users.png",
                    width: width * 0.15,
                    height: height * 0.09,
                    color: Color(0XFF338D9B)),
                SizedBox(height: height * 0.025),
                Text(
                  "Are you sure , you want to join as a volunteer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.048,
                    decoration: BoxDecoration(
                      color: Color(0xFF338D9B),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusSeven),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VolunteerMembership()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.04),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusSeven),
                        ),
                      ),
                      child: Text(
                        "Become a  volunteer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.0125), // Space between buttons

                // Skip Button
                Center(
                  child: TextButton(
                    onPressed: () =>
                        Get.offAll(() => BottomNavScreen(initialPageIndex: 0)),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(292.48, 26),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "Back To Home",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.04,
                        height: 25.02 / 12.13,
                        letterSpacing: 0,
                        color: Color(0XFF338D9B),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => BottomNavScreen(initialPageIndex: 0));
        return false;
      },
      child: Scaffold(
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
                "Successfully paid to Abhisree Foundation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.058,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: height * 0.03),
              // Text(
              //   "₹1000",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: width * 0.065,
              //     fontWeight: FontWeight.w700,
              //     fontFamily: "Poppins",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
