

import 'dart:convert';
import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Mainscreen> {
  int? userId;
  String? role;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    role = prefs.getString('role');

    if (userJson != null) {
      Map<String, dynamic> decodedUserData = jsonDecode(userJson);
      userId = decodedUserData['id'];

      print("User ID: $userId");
      print("User Role: $role");
    }
  }

  Widget _buildCard({
    required double width,
    required double height,
    required String imagePath,
    required String title,
    required String description,
    required VoidCallback onPressed,
    required String buttonText,
    bool outlined = false,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0XFFF3F3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.03,
        horizontal: width * 0.04,
      ),
      margin: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.015),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: height * 0.089,
            width: width * 0.2,
          ),
          SizedBox(height: height * 0.015),
          Text(
            title,
            style: TextStyle(
              fontSize: width * 0.049,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.01),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: width * 0.035),
          ),
          SizedBox(height: height * 0.025),
          CustomButton(
            text: buttonText,
            onPressed: onPressed,
            outlined: outlined,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 181, 233, 240),
              Colors.white,
              Colors.white,
              Color.fromARGB(255, 181, 233, 240),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.08),
              _buildCard(
                width: width,
                height: height,
                imagePath: 'assets/images/Png/HandHeart.png',
                title: 'Make a Donation',
                description: 'Support our causes and make a difference in the community',
                buttonText: 'Donate Now',
                onPressed: () => Get.offAll(() => BottomNavScreen(initialPageIndex: 0)),
              ),
              _buildCard(
                width: width,
                height: height,
                imagePath: 'assets/images/Png/Users.png',
                title: 'Join as volunteer (freelancer)',
                description:
                    'Get started with a free membership by completing the form and enjoy priority access to services.',
                buttonText: 'Become a volunteer',
                onPressed: () => Navigator.pushNamed(context, AppRoutes.volunteerScreen),
                outlined: true,
              ),
              _buildCard(
                width: width,
                height: height,
                imagePath: 'assets/images/Png/Users.png',
                title: 'Join as Employee (freelancer)',
                description:
                    'Get started with a free membership by completing the form and enjoy priority access to services.',
                buttonText: 'Become a Employee',
                onPressed: () => Navigator.pushNamed(context, AppRoutes.employeeagrement),
                outlined: true,
              ),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
