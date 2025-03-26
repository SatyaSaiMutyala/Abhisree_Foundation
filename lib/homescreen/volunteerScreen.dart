import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Volunteerscreen extends StatefulWidget {
  @override
  _VolunteerscreenState createState() => _VolunteerscreenState();
}

class _VolunteerscreenState extends State<Volunteerscreen>{
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    const textData = [
      {'text': 'Raise funds by volunteering.'},
      {
        'text':
            'Join as a freelancer and support our initiatives while earning.'
      },
      {
        'text':
            'Earn rewards through referrals and withdraw your earnings easily.'
      },
      {'text': 'Get instant joining confirmation with lifetime validity.'},
      {'text': ' Participate in meaningful social work and events.'},
      {
        'text':
            'Receive a personalized visiting card for professional networking.'
      }
    ];

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
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.05, left: width * 0.05),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFEFEEEE),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back,
                          color: Colors.black, size: width * 0.06),
                    ),
                  ),
                ],
              ),
            ),


            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Png/Users.png',
                      width: width * 0.2),
                  Text(
                    "Join as volunteer",
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Text(
                      "Get started with a free membership by completing the form and enjoy priority access to services.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: Center(
                      child: Text(
                        'Membership in the Abhisree Foundation gives you good opportunities.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.042,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                    ),
                    child: Column(
                      children: textData
                          .map(
                            (item) => Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: width * 0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/Png/Arrow.png',
                                    width: width * 0.1,
                                  ),
                                  SizedBox(width: width * 0.02),
                                  Expanded(
                                    child: Text(
                                      item['text']!,
                                      style: TextStyle(
                                        fontSize: width * 0.035,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  // SizedBox(height: height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          activeColor:
                              Color(0xFF338D9B), // Checkbox background color
                          checkColor: Colors.white, // Tick mark color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                4), // Optional: Adds slight rounding to checkbox
                          ),
                        ),
                        // SizedBox(width: width * 0.0),
                        Text(
                          'I agree with ',
                          style: TextStyle(
                            fontSize: width * 0.035,
                          ),
                        ),
                        Text(
                          'terms and conditions',
                          style: TextStyle(
                            fontSize: width * 0.035,
                            color: Color(0xFF1A73E8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: CustomButton(text: 'Countinue', onPressed: () => Navigator.pushNamed(context, AppRoutes.volunteerMembership)),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
