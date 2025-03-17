import 'package:adhisree_foundation/homescreen/donation_model/donation_details_screen.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_form_details.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_pride_card.dart';
import 'package:flutter/material.dart';

class DonationModalScreen {
  static void showDonationPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Close on tap outside
      barrierLabel: "DonationPopup",
      transitionDuration: Duration(milliseconds: 300), // Smooth animation
      pageBuilder: (context, animation, secondaryAnimation) {
        return Stack(
          clipBehavior: Clip.none, // Allows positioning outside modal
          children: [
            // The Bottom Modal
            Positioned(
              bottom: 0, // Attach modal to the bottom
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 606,
                padding: EdgeInsets.fromLTRB(25, 30, 25, 42),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image with GestureDetector
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DonationDetailsScreen(
                                imagePath: "assets/slider1.png",
                                title: "Below Poverty Level Students",
                                description:
                                    "Supporting Below Poverty Level (BPL) students can make a significant impact on their education and future.",
                                donationOptions: [
                                  {
                                    "amount": "₹1000",
                                    "name": "Basic school kits for 5 students"
                                  },
                                  {
                                    "amount": "₹2000",
                                    "name": "School uniform for 5 students"
                                  },
                                  {
                                    "amount": "₹5000",
                                    "name": "Full meals for 8 students"
                                  },
                                  {
                                    "amount": "₹8000",
                                    "name": "Full Year Support"
                                  },
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 300,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/slider1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 28),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // "Below Poverty Level Students" Title
                        SizedBox(
                          width: 347,
                          child: Text(
                            "Below poverty level students",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              // height: 1.2, // Proper line-height ratio
                              letterSpacing: 0,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        SizedBox(
                            height: 9), // Gap between title and description

                        Container(
                          width: 347,
                          padding:
                              EdgeInsets.all(8), // Padding inside the black box

                          child: Text(
                            "Supporting Below Poverty Level (BPL) students can make a significant impact on their education and future.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              // height: 1.5, // Adjust line height
                              letterSpacing: 0,
                              color: Colors
                                  .black, // White text on black background
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // "Below Poverty Level Students" Title
                        SizedBox(
                          width: 347,
                          child: Text(
                            "School Supplies",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              // height: 1.2, // Proper line-height ratio
                              letterSpacing: 0,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        SizedBox(
                            height: 9), // Gap between title and description

                        Container(
                          width: 347,
                          padding:
                              EdgeInsets.all(8), // Padding inside the black box

                          child: Text(
                            "Notebooks, Textbooks , pens, bags, uniforms, and shoes and Helping students who can't afford them.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              // height: 1.5, // Adjust line height
                              letterSpacing: 0,
                              color: Colors
                                  .black, // White text on black background
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          DonationPriceCard(
                              amount: "₹1000",
                              name: "Basic school kits for 5 students"),
                          SizedBox(width: 16),
                          DonationPriceCard(
                              amount: "₹2000",
                              name: "School uniform for 5 students"),
                          SizedBox(width: 16),
                          DonationPriceCard(
                              amount: "₹5000",
                              name: "Full meals for 8 students"),
                          SizedBox(width: 16),
                          DonationPriceCard(
                              amount: "₹8000", name: "Full Year Support"),
                        ],
                      ),
                    ),

                    Spacer(), // Push button to bottom

                    // Donate Now Button
                    Center(
                      child: SizedBox(
                        width: 343,
                        height: 53,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible:
                                  true, // Close popup when tapping outside
                              builder: (context) {
                                return Stack(
                                  children: [
                                    Positioned(
                                      top: 233,
                                      left: 25,
                                      child: Material(
                                        color: Colors.transparent,
                                        child:
                                            DonationPopupForm(), // Your popup widget
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF338D9B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          child: Text(
                            "SEND YOUR DONATION",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Close Button above the modal
            Positioned(
              top: 182, // Adjust height above modal
              left: MediaQuery.of(context).size.width / 2 -
                  20, // Center horizontally
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
