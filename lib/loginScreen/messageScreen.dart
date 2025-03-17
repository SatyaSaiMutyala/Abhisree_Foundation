
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Messagescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 181, 233, 240), 
      statusBarIconBrightness: Brightness.dark, 
    ));
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
      
     child : Center(
      child : Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(), 
         Image.asset('assets/images/Png/messageImg.png'),
         SizedBox(height: height * 0.03),
         Text(
          'GIVE WITH HEART,',
          style: TextStyle(
            color: Colors.black,
            fontSize: width * 0.07,
            fontWeight: FontWeight.bold,
          ),
         ),
         Text(
          'CHANGE THE WORLD',
          style: TextStyle(
            color: Colors.black,
            fontSize: width * 0.07,
            fontWeight: FontWeight.bold,
          ),
         ),
        Spacer(), // Pushes button to the bottom
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: width * 0.03 ),
              child: CustomButton(text: 'Next', onPressed: () {Navigator.pushNamed(context, AppRoutes.LoginWithNumber);}),
            ),
        ],
      ),
      ),
      ),
    );
  }
}