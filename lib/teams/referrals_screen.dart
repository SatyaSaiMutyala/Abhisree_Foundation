// import 'dart:convert';

// import 'package:adhisree_foundation/controllers/teamsController.dart';
// import 'package:adhisree_foundation/utils/dimensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:adhisree_foundation/teams/referral_amount.dart';
// import 'package:adhisree_foundation/widgets/custom_appbar.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../models/referralModel.dart';

// class ReferralsScreen extends StatefulWidget {
//   @override
//   _ReferralsScreenState createState() => _ReferralsScreenState();
// }

// class _ReferralsScreenState extends State<ReferralsScreen> {
//   final ReferralController referralController = Get.put(ReferralController());
//   final RxString searchQuery = ''.obs;


//   int? userId;
//   String refCode = '';
//   final String playStoreLink =
//       "https://play.google.com/store/apps/details?id=com.adhisree.foundation";

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? userJson = prefs.getString('user');
//     String? role = prefs.getString('role');

//     if (userJson != null) {
//       Map<String, dynamic> decodedUserData = jsonDecode(userJson);

//       setState(() {
//         userId = decodedUserData['id'];
//         refCode = decodedUserData['ref_id'];
//       });

//       print("User ID: $userId");
//       print("User REF-ID: $refCode");
//       print('User REF-ID: $role');
//     }
//     if (userId != null) {
//       referralController.fetchReferralData(userId.toString());
//     }
//   }

//   // Dummy list of referred users
//   final List<Map<String, String>> referredUsers = [
//     {
//       "name": "John Doe",
//       "date": "12 Mar 2025",
//       "time": "10:45 AM",
//       "amount": "+25",
//       "image": 'assets/images/Png/teams1.png'
//     },
//     {
//       "name": "Emma Watson",
//       "date": "14 Mar 2025",
//       "time": "12:30 PM",
//       "amount": "+25",
//       "image": 'assets/images/Png/teams1.png'
//     },
//     {
//       "name": "Michael Smith",
//       "date": "15 Mar 2025",
//       "time": "03:15 PM",
//       "amount": "+25",
//       "image": 'assets/images/Png/teams1.png'
//     },
//   ];

//   void copyToClipboard() {
//     Clipboard.setData(ClipboardData(text: refCode));
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Referral code copied!")),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(body: Obx(() {
//       if (referralController.isLoading.value) {
//         return Center(child: CircularProgressIndicator());
//       }
//       ReferralResponse? referralData = referralController.referralData.value;
//       List<ReferralUser> primaryReferrals = referralData?.primaryReferral ?? [];

//       print('referal ------------>${primaryReferrals.length}');

//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomAppBar(
//             screenType: 'referral',
//             onReferralSearchChanged: (query) {
//               // Filter referral data in your screen based on `query`
//             },
//           ),

//           SizedBox(height: width * 0.04),

//           // Referrals Title
//           Padding(
//             padding: EdgeInsets.only(left: 24),
//             child: Text(
//               "Referrals",
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           SizedBox(height: 16),

//           // Referral Amount Widget
//           ReferralAmountWidget(),
//           SizedBox(height: width * 0.07),

//           // Copy Referral Code & Share Buttons
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: width * 0.05),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal, // Enables horizontal scrolling
//               child: Row(
//                 children: [
//                   // Copy Referral Code Card
//                   Container(
//                     width: (width / 2) * 0.845,
//                     height: 66,
//                     padding: EdgeInsets.all(width * 0.025),
//                     margin: EdgeInsets.only(
//                         right: width * 0.025), // Adds spacing between items
//                     decoration: BoxDecoration(
//                       color: Color(0xFFF6F2F2),
//                       borderRadius:
//                           BorderRadius.circular(Dimensions.radiusDefault),
//                       border: Border.all(color: Color(0xFFE4DFDF)),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Referral Code Box
//                         Container(
//                           width: width * 0.2,
//                           height: 34,
//                           alignment: Alignment.center,
//                           child: Text(
//                             refCode,
//                             style: TextStyle(
//                               fontFamily: 'Inter',
//                               fontSize: width * 0.04,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: 1.2,
//                               color: Color(0xFF78797E),
//                             ),
//                           ),
//                         ),

//                         // Copy Button with Text
//                         GestureDetector(
//                           onTap: copyToClipboard,
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: width * 0.07,
//                                 height: 24,
//                                 child: Icon(Icons.copy,
//                                     color: Color(0xFF338D9B),
//                                     size: width * 0.04),
//                               ),
//                               SizedBox(width: width * 0.01),
//                               Text(
//                                 "Copy",
//                                 style: TextStyle(
//                                   fontFamily: 'Inter',
//                                   fontSize: width * 0.035,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xFF338D9B),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: width * 0.03,
//                   ),
//                   // Share Referral Code Card
//                   GestureDetector(
//                     onTap: () {
//                       print('Container tapped');
//                       Share.share(
//                         "🎉 Join Adhisree Foundation!\n\nUse my referral code: $refCode to sign up.\n\n📲 Download the app now:\n$playStoreLink",
//                       );
//                     },
//                     child: Container(
//                       width: (width / 2) * 0.845,
//                       height: 66,
//                       padding: EdgeInsets.all(width * 0.025),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFF6F2F2),
//                         borderRadius:
//                             BorderRadius.circular(Dimensions.radiusDefault),
//                         border: Border.all(color: Color(0xFFE4DFDF)),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Image.asset(
//                             "assets/icons/share_icon.png",
//                             width: 24,
//                             height: 24,
//                           ),
//                           Container(
//                             width: width * 0.25,
//                             height: height * 0.02,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "Share",
//                               style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontSize: width * 0.035,
//                                 fontWeight: FontWeight.w500,
//                                 color: Color(0xFF338D9B),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),

//           SizedBox(height: width * 0.04),
//           Padding(
//             padding: EdgeInsets.only(left: width * 0.06),
//             child: Text(
//               "Referrals list",
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//                 fontSize: width * 0.042,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           SizedBox(height: width * 0.05),

//           // Referral List
//           Expanded(
//             child: ListView.separated(
//               padding: EdgeInsets.symmetric(horizontal: width * 0.05),
//               itemCount: primaryReferrals.length,
//               separatorBuilder: (context, index) => Column(
//                 children: [
//                   SizedBox(height: width * 0.025), // 83px gap
//                   Divider(color: Colors.grey, thickness: 1), // Horizontal line
//                   SizedBox(height: width * 0.025), // 83px gap
//                 ],
//               ),
//               itemBuilder: (context, index) {
//                 final user = primaryReferrals[index];
//                 return Row(
//                   children: [
//                     // User Profile Image
//                     CircleAvatar(
//                       radius: Dimensions.radiusDoubleExtraLarge,
//                       backgroundImage: user.photoPath != null
//                           ? NetworkImage(user.photoPath!)
//                           : AssetImage('assets/images/Png/user.png')
//                               as ImageProvider,
//                     ),
//                     SizedBox(width: width * 0.03),

//                     // User Name & Date/Time
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '${user.firstName} ${user.lastName}' ?? '',
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontSize: width * 0.035,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: width * 0.0125),
//                         Text(
//                           // "${user.} - ${user["time"]}",
//                           user.phoneNumber ?? '',
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontSize: width * 0.03,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),

//                     Spacer(),

//                     // Amount
//                     Text(
//                       // user["amount"]!,
//                       '₹120',
//                       style: TextStyle(
//                         fontFamily: 'Inter',
//                         fontSize: width * 0.04,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.green,
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       );
//     }));
//   }
// }







import 'dart:convert';

import 'package:adhisree_foundation/controllers/teamsController.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adhisree_foundation/teams/referral_amount.dart';
import 'package:adhisree_foundation/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/referralModel.dart';

class ReferralsScreen extends StatefulWidget {
  @override
  _ReferralsScreenState createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends State<ReferralsScreen> {
  final ReferralController referralController = Get.put(ReferralController());
  final RxString searchQuery = ''.obs;

  int? userId;
  String refCode = '';
  final String playStoreLink =
      "https://play.google.com/store/apps/details?id=com.adhisree.foundation";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');

    if (userJson != null) {
      Map<String, dynamic> decodedUserData = jsonDecode(userJson);
      setState(() {
        userId = decodedUserData['id'];
        refCode = decodedUserData['ref_id'] ?? '';
      });
      if (userId != null) {
        referralController.fetchReferralData(userId.toString());
      }
    }
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: refCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Referral code copied!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        if (referralController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        ReferralResponse? referralData = referralController.referralData.value;
        List<ReferralUser> primaryReferrals = referralData?.primaryReferral
                ?.where((user) {
                  final fullName =
                      "${user.firstName ?? ''} ${user.lastName ?? ''}"
                          .toLowerCase();
                  return fullName.contains(searchQuery.value);
                })
                .toList() ??
            [];

        return SafeArea(
           top: false,
          child: Column(
            children: [
              CustomAppBar(
                screenType: 'referral',
                onReferralSearchChanged: (query) {
                  searchQuery.value = query.toLowerCase();
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: width * 0.04),
                      Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          "Referrals",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      ReferralAmountWidget(),
                      SizedBox(height: width * 0.07),

                      // Copy and Share
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                width: (width / 2) * 0.845,
                                height: 66,
                                padding: EdgeInsets.all(width * 0.025),
                                margin:
                                    EdgeInsets.only(right: width * 0.025),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F2F2),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusDefault),
                                  border:
                                      Border.all(color: Color(0xFFE4DFDF)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * 0.2,
                                      alignment: Alignment.center,
                                      child: Text(
                                        refCode,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                          color: Color(0xFF78797E),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: copyToClipboard,
                                      child: Row(
                                        children: [
                                          Icon(Icons.copy,
                                              color: Color(0xFF338D9B),
                                              size: width * 0.04),
                                          SizedBox(width: width * 0.01),
                                          Text(
                                            "Copy",
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF338D9B),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: width * 0.03),
                              GestureDetector(
                                onTap: () {
                                  Share.share(
                                    "🎉 Join Adhisree Foundation!\n\nUse my referral code: $refCode to sign up.\n\n📲 Download the app now:\n$playStoreLink",
                                  );
                                },
                                child: Container(
                                  width: (width / 2) * 0.845,
                                  height: 66,
                                  padding: EdgeInsets.all(width * 0.025),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF6F2F2),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault),
                                    border:
                                        Border.all(color: Color(0xFFE4DFDF)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/icons/share_icon.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                      Text(
                                        "Share",
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF338D9B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: width * 0.04),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.06),
                        child: Text(
                          "Referrals list",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.042,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: width * 0.05),

                      // Referral List
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.05),
                        itemCount: primaryReferrals.length,
                        separatorBuilder: (context, index) => Column(
                          children: [
                            SizedBox(height: width * 0.025),
                            Divider(color: Colors.grey, thickness: 1),
                            SizedBox(height: width * 0.025),
                          ],
                        ),
                        itemBuilder: (context, index) {
                          final user = primaryReferrals[index];
                          return Row(
                            children: [
                              CircleAvatar(
                                radius: Dimensions.radiusDoubleExtraLarge,
                                backgroundImage: user.photoPath != null
                                    ? NetworkImage(user.photoPath!)
                                    : AssetImage('assets/images/Png/user.png')
                                        as ImageProvider,
                              ),
                              SizedBox(width: width * 0.03),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${user.firstName ?? ''} ${user.lastName ?? ''}',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: width * 0.0125),
                                  Text(
                                    user.phoneNumber ?? '',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                '₹120',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
