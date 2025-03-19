import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/homescreen/home_screen.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreens extends StatelessWidget {
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
              "Successfully paid to Abhisree Foundation",
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
                onPressed: ()=> Get.to(() => BottomNavScreen(initialPageIndex: 0))
              ),
            ),
          ],
        ),
      ),
    );
  }
}
