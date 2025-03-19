
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';


class Loginwithnumberscreen extends StatefulWidget {
  @override
  _LoginWithNumberState createState() => _LoginWithNumberState();
}


class _LoginWithNumberState extends State<Loginwithnumberscreen> {
  final TextEditingController _numberController = TextEditingController();
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
        ], begin: Alignment.topCenter, end: Alignment.bottomRight)
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Column(children: [
                    Text(
                      'Log in',
                      style: TextStyle(
                          fontSize: width * 0.07, fontWeight: FontWeight.bold),
                    ),
                    // SizedBox(height: 5),
                    Text(
                      'Welcome back !',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.03),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mobile Number',
                        style: TextStyle(
                          fontSize: width * 0.032,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFF9F7F7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: _numberController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: height * 0.015,
                                horizontal: width * 0.03,
                              ),
                            ),
                          )))
                ])),
            SizedBox(height: height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.018, horizontal: width * 0.07),
              child: CustomButton(
                text: 'LOG IN',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.OtpScreen);
                },
              ),
            ),
            SizedBox(height: height * 0.01),
            Column(
              children: [
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.02),
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
                                height: height * 0.03,
                                width: width * 0.08,
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                'Login with Google',
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ))),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.015),
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.referralCode),
                    child: Text(
                      'I have a referral code',
                      style: TextStyle(
                        color: Color(0XFF338D9B),
                        fontSize: width * 0.035,
                      ),
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
