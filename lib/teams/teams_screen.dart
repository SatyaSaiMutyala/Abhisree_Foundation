import 'package:adhisree_foundation/utils/dimensions.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          // Custom AppBar
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 362,
                decoration: BoxDecoration(
                  color: Color(0xFF338D9B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: 62,
                left: MediaQuery.of(context).size.width -
                  24,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.red, // Red circle color
                    shape: BoxShape.circle, // Makes it a perfect circle
                  ),
                ),
              ),

              Positioned(
                top: 62,
                child: Container(
                  width: 111,
                  height: 110,
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
                top: 185,
                left: 107,
                child: Container(
                  width: 199,
                  height: 33,
                  alignment: Alignment.center,
                  child: Text(
                    "Prasanth Varma",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                top: 213,
                left: 130,
                child: Container(
                  width: screenWidth * 0.4,
                  height: 17,
                  alignment: Alignment.center,
                  child: Text(
                    "Vice-Chairman",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // New Button Positioned Below Vice-Chairman
              Positioned(
                top: 244,
                left: 141,
                child: Container(
                  width: screenWidth * 0.4,
                  height: 35,
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    border: Border.all(color: Color(0xFFCFCBCB), width: 0.55),
                    borderRadius: BorderRadius.circular(8.78),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "View activities",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(width: 5), // Spacing between text and icon
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 303, // Placed below "View Activities"
                left: 42,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progress Bar
                    Stack(
                      children: [
                        Container(
                          width: 310,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Color(0xFFEDEDED),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusDefault),
                          ),
                        ),
                        Container(
                          width: 160, // Example progress width
                          height: 10,
                          decoration: BoxDecoration(
                            color: Color(0XFF136571),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusDefault),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9.55), // Spacing after the progress bar

                    // Donation Info Row
                    SizedBox(
  width: 310, // Set a defined width
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Progress",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      Text(
        "8/10",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: Dimensions.fontSizeSmall,
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
            width: 370,
            height: 32,
            margin: EdgeInsets.only(top: 26, left: 10),
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
                    width: 160,
                    height: 25,
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: showPrimary ? Colors.black : Colors.transparent,
                    //   borderRadius: BorderRadius.circular(6),
                    // ),
                    child: Text(
                      "Primary Referrals",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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
                    width: 172,
                    height: 21,
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: showPrimary ? Colors.transparent : Color(0xFFB8B5B5),
                    //   borderRadius: BorderRadius.circular(6),
                    // ),
                    child: Text(
                      "Secondary Referral",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: showPrimary ? Color(0xFFB8B5B5) : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
// Line Divider
          Container(
            width: 370,
            margin: EdgeInsets.only(top: 10), // Space after referral tabs
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Color(0xFFDEDEDE), width: 1), // Thin gray line
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
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
                      width: 365,
                      height: 62,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(member['image']!),
                                radius: 25, // Profile size
                              ),
                              SizedBox(
                                  width: 15), // Space between image and text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    member['name']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    member['role']!,
                                    style: TextStyle(
                                      fontSize: 14,
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
                            width: 83,
                            height: 33,
                            alignment: Alignment.center,
                            child: Text(
                              "64392564805", // Static for now; replace with dynamic data if needed
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xFF6F6B6B),
                                letterSpacing: 0,
                                height: 1.0, // Center text properly
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Separator Line
                    Container(
                      width: 342,
                      height: 1,
                      margin: EdgeInsets.symmetric(vertical: 10),
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
