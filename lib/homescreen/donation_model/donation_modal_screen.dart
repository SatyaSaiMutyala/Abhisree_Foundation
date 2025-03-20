import 'package:flutter/material.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_details_screen.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_form_details.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_pride_card.dart';
import 'package:adhisree_foundation/utils/customButton.dart';

class DonationModalScreen {
  static void showDonationPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "DonationPopup",
      transitionDuration: const Duration(milliseconds: 300),
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
                decoration: const BoxDecoration(
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
                            image: const DecorationImage(
                              image: AssetImage("assets/images/Png/child.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    _buildTextSection(
                      title: "Below Poverty Level Students",
                      description: "Supporting Below Poverty Level (BPL) students can make a significant impact on their education and future.",
                    ),
                    const SizedBox(height: 20),
                    _buildTextSection(
                      title: "School Supplies",
                      description: "Notebooks, Textbooks, pens, bags, uniforms, and shoes. Helping students who can't afford them.",
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          DonationPriceCard(amount: "₹1000", name: "Basic school kits"),
                          const SizedBox(width: 16),
                          DonationPriceCard(amount: "₹2000", name: "School uniform"),
                          const SizedBox(width: 16),
                          DonationPriceCard(amount: "₹5000", name: "Full meals"),
                          const SizedBox(width: 16),
                          DonationPriceCard(amount: "₹8000", name: "Full Year Support"),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: SizedBox(
                        width: 343,
                        height: 53,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: DonationPopupForm(),
                                  ),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF338D9B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 11),
                          ),
                          child: const Text(
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
                    SizedBox(height: height * 0.03),
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