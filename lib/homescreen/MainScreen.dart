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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 181, 233, 240),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Color.fromARGB(255, 181, 233, 240),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight
            )
        ),

        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Container(
                 width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0XFFF3F3F3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(width * 0.01),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child:  Column(
                    children: [
                      Image.asset('assets/images/Png/HandHeart.png', height: height * 0.089, width: width * 0.2,),
                      Text(
                        'Make a Donation',
                        style:  TextStyle(
                          fontSize: width * 0.049,
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                      SizedBox( height: height * 0.01 ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: width * 0.065),
                     child: Center( 
                      child: Text(
                        'Support our causes and make a difference in the community',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.035),
                    )),),

                    SizedBox(height: height * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child:  CustomButton(text: 'Donate Now', onPressed: ()=> Get.to(() => BottomNavScreen(initialPageIndex: 0))),
                      ),

                      SizedBox(height: height * 0.04),

                    ],
                  ),
              ),
              SizedBox(height: height * 0.06 ),

                Container(
                 width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0XFFF3F3F3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(width * 0.01),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child:  Column(
                    children: [
                      Image.asset('assets/images/Png/Users.png', height: height * 0.089, width: width * 0.2,),
                      Text(
                        'Join as volunteer (freelancer)',
                        style:  TextStyle(
                          fontSize: width * 0.049,
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                      SizedBox( height: height * 0.01 ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: width * 0.065),
                     child: Center( 
                      child: Text(
                        'Get started with a free membership by completing the form and enjoy priority access to services.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.035),
                    )),),

                    SizedBox(height: height * 0.02),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child:  CustomButton(text: 'Become a volunteer', onPressed: () => Navigator.pushNamed(context, AppRoutes.volunteerScreen ), outlined: true,),
                      ),

                      SizedBox(height: height * 0.04),

                    ],
                  ),
              ),
          ],
        ),
        
        ),
    );
  }
}