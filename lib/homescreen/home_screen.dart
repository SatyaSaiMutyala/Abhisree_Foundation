import 'package:adhisree_foundation/homescreen/active_campaigns.dart';
import 'package:adhisree_foundation/homescreen/donation_categories.dart';
import 'package:adhisree_foundation/homescreen/slider_screen.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/widgets/custom_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imageList = [
    'assets/slider1.png',
    'assets/slider2.png',
    'assets/slider3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            // AppBar
            // Container(
            //   height: 223,
            //   decoration: BoxDecoration(
            //     color: Color(0XFF97D7E0),
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(32),
            //       bottomRight: Radius.circular(32),
            //     ),
            //   ),
            //   child: Stack(
            //     children: [
            //       // Menu Button
            //       Positioned(
            //         top: 59,
            //         left: 24,
            //         child: Container(
            //           width: 40,
            //           height: 41,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(20),
            //           ),
            //           child: IconButton(
            //             icon: Icon(Icons.menu, color: Colors.black),
            //             onPressed: () {},
            //           ),
            //         ),
            //       ),

            //       // Notification Button
            //       Positioned(
            //         top: 59,
            //         right: 24,
            //         child: Container(
            //           width: 40,
            //           height: 41,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
            //           ),
            //           child: IconButton(
            //             icon:
            //                 Icon(Icons.notifications_none, color: Colors.black),
            //             onPressed: () {},
            //           ),
            //         ),
            //       ),

            //       // Search Bar
            //       Positioned(
            //         top: 127,
            //         left: 24,
            //         right: 24,
            //         child: Container(
            //           height: 47,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.black12,
            //                 blurRadius: 4,
            //                 offset: Offset(0, 2),
            //               ),
            //             ],
            //           ),
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 6),
            //             child: TextField(
            //               decoration: InputDecoration(
            //                 hintText: "Search...",
            //                 prefixIcon: Icon(Icons.search, color: Colors.black),
            //                 border: InputBorder.none,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(height: Dimensions.sizedBoxSizeExtrsMedLarge),

            SliderScreen(),
            // Image Slider
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
            //     child: CarouselSlider(
            //       options: CarouselOptions(
            //         height: Dimensions.sliderImageWidth,
            //         autoPlay: true,
            //         enlargeCenterPage: true,
            //         viewportFraction: 1.0,
            //       ),
            //       items: imageList.map((imagePath) {
            //         return Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
            //           ),
            //           child: Image.asset(
            //             imagePath,
            //             fit: BoxFit.cover,
            //             width: double.infinity,
            //             height: Dimensions.sliderImageWidth,
            //           ),
            //         );
            //       }).toList(),
            //     ),
            //   ),
            // ),

            SizedBox(height: Dimensions.sizedBoxSizeExtraMoreLargeplus),

            DonationCategoryScreen(),
            // Donation Categories Title
            // Padding(
            //   padding: EdgeInsets.only(left: Dimensions.paddingSizeExtraLargeFix),
            //   child: Text(
            //     "Donation Categories",
            //     style: TextStyle(
            //       fontFamily: 'Poppins',
            //       fontWeight: FontWeight.w600,
            //       fontSize: Dimensions.fontSizeLarge,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),

            // SizedBox(height: Dimensions.sizedBoxSizeDefault),

            // // Education Category Card
            // Padding(
            //   padding: EdgeInsets.only(left: Dimensions.paddingSizeExtraLargeFix),
            //   child: Container(
            //     width: 110,
            //     height: 92,
            //     padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall, horizontal: Dimensions.paddingSizeLarge),
            //     decoration: BoxDecoration(
            //       color: Color(0xFFF3F3F3),
            //       borderRadius: BorderRadius.circular(Dimensions.radiusDefaultExpand),
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(Icons.school, size: Dimensions.iconSizeDoubleExtraLarge, color: Colors.black),
            //         SizedBox(height: Dimensions.sizedBoxSizeExtraSmall),
            //         Text(
            //           "Education",
            //           style: TextStyle(
            //             fontFamily: 'Poppins',
            //             fontSize: Dimensions.fontSizeDefault,
            //             fontWeight: FontWeight.w500,
            //             color: Theme.of(context).shadowColor.withOpacity(0.8),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            SizedBox(height: Dimensions.sizedBoxSizeExtraMoreLargeplus),

            // Active Campaigns Title
            ActiveCampaigns(),
            // Padding(
            //   padding: EdgeInsets.only(left: Dimensions.paddingSizeExtraLargeFix),
            //   child: Text(
            //     "Active Campaigns",
            //     style: TextStyle(
            //       fontFamily: 'Poppins',
            //       fontWeight: FontWeight.w600,
            //       fontSize: Dimensions.fontSizeLarge,
            //       color: Theme.of(context).shadowColor.withOpacity(0.8),
            //     ),
            //   ),
            // ),

            // SizedBox(height: Dimensions.sizedBoxSizeLarge),

            // // Active Campaign Card
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
            //   child: Container(
            //     width: 351,
            //     height: 289,
            //     padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            //     decoration: BoxDecoration(
            //       color: Color(0xFFF9F9F9),
            //       borderRadius: BorderRadius.circular(20),
            //       border: Border.all(color: Color(0xFFEDEDED), width: 1),
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         // Campaign Image
            //         Container(
            //           width: 319,
            //           height: 127,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
            //             image: DecorationImage(
            //               image: AssetImage('assets/campaign1.png'),
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //         SizedBox(height: Dimensions.sizedBoxSizeSmall),

            //         // Campaign Title
            //         Text(
            //           "Health care support",
            //           style: TextStyle(
            //             fontFamily: 'Poppins',
            //             fontWeight: FontWeight.w600,
            //             fontSize: Dimensions.fontSizeSmall,
            //             color: Colors.black,
            //           ),
            //         ),
            //         SizedBox(height: 5),

            //         // Progress Bar
            //         Stack(
            //           children: [
            //             Container(
            //               width: 319,
            //               height: 10,
            //               decoration: BoxDecoration(
            //                 color: Color(0xFFEDEDED),
            //                 borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            //               ),
            //             ),
            //             Container(
            //               width: 160, // Example progress width
            //               height: 10,
            //               decoration: BoxDecoration(
            //                 color: Color(0XFF338D9B),
            //                 borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(height: Dimensions.sizedBoxSizeSmall),

            //         // Donation Info
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               "\$2,500 Raised",
            //               style: TextStyle(
            //                 fontFamily: 'Poppins',
            //                 fontSize: Dimensions.fontSizeDefault,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black,
            //               ),
            //             ),
            //             Text(
            //               "20000 Goal",
            //               style: TextStyle(
            //                 fontFamily: 'Poppins',
            //                 fontSize: Dimensions.fontSizeSmall,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(height: Dimensions.sizedBoxSizeSmall), // Space before button

            //         // Donate Now Button
            //         SizedBox(
            //           width: 319,
            //           height: 41,
            //           child: ElevatedButton(
            //             onPressed: () {
            //               // TODO: Add donation functionality
            //             },
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.white, // Background color
            //               side: BorderSide(
            //                   color: Color(0xFF338D9B), width: 1), // Border
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(
            //                     Dimensions.radiusDefaultExpand), // Small border radius
            //               ),
            //               // padding: EdgeInsets.symmetric(
            //               //     vertical: 11, horizontal: 154), // Padding
            //             ),
            //             child: Text(
            //               "Donate Now",
            //               style: TextStyle(
            //                 color: Color(0xFF338D9B), // Text color
            //                 fontFamily: 'Poppins',
            //                 fontSize: Dimensions.fontSizeDefault,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            SizedBox(height: 50), // Extra space at the bottom
          ],
        ),
      ),
    );
  }
}
