import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Referralcodescreen extends StatefulWidget {
  @override
  _ReferralcodeState createState() => _ReferralcodeState();
}

class _ReferralcodeState extends State<Referralcodescreen> {
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0XFFEFEEEE),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,
                    color: Colors.black, size: width * 0.05),
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.05),
                  Text(
                    'Enter your referral code',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        width: width * 0.12,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          controller: controllers[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            counterText: "",
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),

                  SizedBox(height: height * 0.05),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child:  CustomButton(text: 'Confirm', onPressed: () => Get.to(() => BottomNavScreen(initialPageIndex: 0))),
                  ),
                ],
              ),
            )));
  }
}
