import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginwithnumberscreen extends StatefulWidget {
  @override
  _LoginWithNumberState createState() => _LoginWithNumberState();
}

class _LoginWithNumberState extends State<Loginwithnumberscreen> {
  final TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0), // Padding for better spacing
          child: Container(
            decoration: BoxDecoration(
              color: Color(0XFFEFEEEE), // Light grey background
              shape: BoxShape.circle, // Circular shape
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Color.fromARGB(255, 181, 233, 240),
        ], begin: Alignment.topCenter, end: Alignment.bottomRight)),
        child: Column(
          children: [
            Center(
              child: Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.paddingSizeExtraMoreLarge),
                  child: Column(children: [
                    Text(
                      'Log in',
                      style: TextStyle(
                          fontSize: Dimensions.fontSizeForReview,
                          fontWeight: FontWeight.bold),
                    ),
                    // SizedBox(height: 5),
                    Text(
                      'Welcome back !',
                      style: TextStyle(
                        fontSize: Dimensions.fontSizeExtraLarge,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ])),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeExtraLarge),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mobile Number',
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeExtraLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFF9F7F7), // Light grey background
                            borderRadius: BorderRadius.circular(
                                10), // Same border radius as TextField
                          ),
                          child: TextField(
                            controller: _numberController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              fontSize: 18, // Increased font size
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 16,
                              ),
                            ),
                          )))
                ])),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.paddingSizeDefault,
                  horizontal: Dimensions.paddingSizeExtraLarge),
              child: CustomButton(
                text: 'LOG IN',
                onPressed: () {
                  Get.to(() => BottomNavScreen(initialPageIndex: 0));
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Column(
              children: [
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: Dimensions.fontSizeExtraLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeExtraLarge),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: Dimensions.paddingSizeDefault),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Color(0XFFF2F1F1),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Png/googleIcon.png',
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Login with Google',
                                style: TextStyle(
                                  fontSize: Dimensions.fontSizeExtraLarge,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeDefault),
                  child: Text(
                    'I have a referral code',
                    style: TextStyle(
                      color: Color(0XFF338D9B),
                      fontSize: Dimensions.fontSizeLarge,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
