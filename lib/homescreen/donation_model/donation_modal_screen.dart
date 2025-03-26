import 'package:flutter/material.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_details_screen.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_form_details.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_pride_card.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';

class DonationModalScreen {
  static void showDonationPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "DonationPopup",
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: height * 0.68,
                padding: EdgeInsets.fromLTRB(
                    width * 0.05, width * 0.07, width * 0.05, width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DonationDetailsScreen(
                                imagePath: "assets/images/Png/child.png",
                                title: "Below Poverty Level Students",
                                description: "Supporting Below Poverty Level (BPL) students can make a significant impact on their education and future.",
                                donationOptions: [
                                  {"amount": "₹1000", "name": "Basic school kits for 5 students"},
                                  {"amount": "₹2000", "name": "School uniform for 5 students"},
                                  {"amount": "₹5000", "name": "Full meals for 8 students"},
                                  {"amount": "₹8000", "name": "Full Year Support"},
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: width,
                          height: height * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/Png/child.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Below poverty level students",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                            fontSize: width * 0.05,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: height * 0.001),
                        Container(
                          padding: EdgeInsets.all(width * 0.01),
                          child: Text(
                            "Supporting Below Poverty Level (BPL) students can make a significant impact on their education and future.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.01),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "School Supplies",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                            fontSize: width * 0.04,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Container(
                          padding: EdgeInsets.all(width * 0.01),
                          child: Text(
                            "Notebooks, Textbooks , pens, bags, uniforms, and shoes and Helping students who can't afford them.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.02),

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
                              amount: "₹8000",
                              name: "Full Year Support for 5 students"),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.03),

                    CustomButton(
                        text: 'SEND YOUR DONATION',
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return Stack(
                                children: [
                                  Align(
                                    alignment: Alignment
                                        .center, 
                                    child: Material(
                                      color: Colors.transparent,
                                      child: DonationPopupForm(),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        })
                  ],
                ),
              ),
            ),
            Positioned(
              top: height * 0.23,
              left: width * 0.45,
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
                  child: const Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget _buildTextSection({required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          description,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}