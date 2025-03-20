import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';

class TeamsScreen extends StatefulWidget {
  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  bool showPrimary = true; // To track which data to show

  final List<Map<String, String>> primaryReferrals = [
    {'name': 'John Doe', 'role': 'CEO', 'image': 'assets/images/Png/teams1.png'},
    {'name': 'Jane Smith', 'role': 'CTO', 'image': 'assets/images/Png/teams1.png'},
  ];

  final List<Map<String, String>> secondaryReferrals = [
    {'name': 'Mike Johnson', 'role': 'Designer', 'image': 'assets/images/Png/teams1.png'},
    {
      'name': 'Emily Davis',
      'role': 'Marketing Head',
      'image': 'assets/images/Png/teams1.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          // Custom AppBar
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: height * 0.42,
                decoration: BoxDecoration(
                  color: Color(0xFF338D9B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width * 0.09),
                    bottomRight: Radius.circular(width * 0.09),
                  ),
                ),
              ),
              Positioned(
                top: width * 0.15,
                right: width * 0.04,
                child: Container(
                  width: width * 0.04,
                  height: height * 0.04,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              Positioned(
                top: width * 0.15,
                child: Container(
                  width: width * 0.25,
                  height: height * 0.12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 6),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Png/teams1.png'), // Replace with your image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: width * 0.44,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "PRASANTH VARMA",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                      fontSize: width * 0.05,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                top: width * 0.504,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "VICE-CHAIRMAN",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.04,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // New Button Positioned Below Vice-Chairman
              Positioned(
                top: width * 0.58,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, AppRoutes.viewActivityScreen)
                  },
                  child:  Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.06),
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    border: Border.all(color: Color(0xFFCFCBCB), width: 0.55),
                    borderRadius: BorderRadius.circular(width * 0.03),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "View activities",
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),),
              ),

              Positioned(
                top: width * 0.75, // Placed below "View Activities"
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progress Bar
                    Stack(
                      children: [
                        Container(
                      width: width * 0.7, 
                          height: height * 0.01,
                          decoration: BoxDecoration(
                            color: Color(0xFFEDEDED),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusDefault),
                          ),
                        ),
                        Container(
                          width: width * 0.6, // Example progress width
                          height: height * 0.011,
                          decoration: BoxDecoration(
                            color: Color(0XFF136571),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusDefault),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),

                    // Donation Info Row
                    SizedBox(
                      width: width * 0.7, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Progress",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: width * 0.034,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "8/10",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: width * 0.034,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          // Referral Bar
          Container(
            width: width * 2,
            // height: 32,
            margin: EdgeInsets.only(top: width * 0.06, left: width * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Primary Referrals Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showPrimary = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Primary Referrals",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        fontSize: width * 0.04,
                        color: showPrimary ? Colors.black : Color(0xFFB8B5B5),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // Secondary Referrals Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showPrimary = false;
                    });
                  },
                  child: Container(
                    width: width * 0.5,
                    alignment: Alignment.center,
                    child: Text(
                      "Secondary Referral",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        fontSize: width * 0.04,
                        color: showPrimary ? Color(0xFFB8B5B5) : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: width * 0.9,
            margin: EdgeInsets.only(top: width * 0.02), 
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Color(0xFFDEDEDE), width: 1), 
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: width * 0.01, right: width * 0.02, top: width * 0.02),
              itemCount: showPrimary
                  ? primaryReferrals.length
                  : secondaryReferrals.length,
              itemBuilder: (context, index) {
                final member = showPrimary
                    ? primaryReferrals[index]
                    : secondaryReferrals[index];

                return Column(
                  children: [
                    Container(
                      width: width * 0.9,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: width * 0.015),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(member['image']!),
                                radius: width * 0.07, // Profile size
                              ),
                              SizedBox( width: width * 0.03), // Space between image and text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    member['name']!,
                                    style: TextStyle(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: height *0.003),
                                  Text(
                                    member['role']!,
                                    style: TextStyle(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF7D7D7D),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Reference Number Box
                          Container(
                            // width: 83,
                            // height: 33,
                            alignment: Alignment.center,
                            child: Text(
                              "64392564805", 
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.03,
                                color: Color(0xFF6F6B6B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Separator Line
                    Container(
                      width: width * 0.9,
                      height: 1,
                      margin: EdgeInsets.symmetric(vertical: width * 0.02),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFE5E5E5), width: 1),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
