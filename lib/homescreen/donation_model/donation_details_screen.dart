import 'package:adhisree_foundation/homescreen/donation_model/donation_form_details.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_pride_card.dart';

class DonationDetailsScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<Map<String, String>> donationOptions;

  const DonationDetailsScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.donationOptions,
  }) : super(key: key);

  @override
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width ;
  double height = MediaQuery.of(context).size.height ;

  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: SingleChildScrollView( 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.38),

                Text(
                  "Below poverty level students",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.032,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * 0.015),

                // Progress Bar
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.01,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      width: width * 0.4,
                      height: height * 0.01,
                      decoration: BoxDecoration(
                        color: Color(0XFF338D9B),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Donation Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$2,500 Raised",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF6F6B6B),
                      ),
                    ),
                    Text(
                      "\$20,000 Goal",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF6F6B6B),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),

                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: width * 0.038,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * 0.01),

                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.03,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: height * 0.02),

                Text(
                  "School Supplies",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.034,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * 0.01),

                Text(
                  "Notebooks, Textbooks, pens, bags, uniforms, and shoes. Helping students who can't afford them.",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.03,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: height * 0.027),

                Text(
                  "Select your amount",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.034,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * 0.025),

                // Donation Cards - Horizontally Scrollable
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: donationOptions.map((option) {
                      return Padding(
                        padding: EdgeInsets.only(right: width * 0.02),
                        child: DonationPriceCard(
                          amount: option["amount"]!,
                          name: option["name"]!,
                        ),
                      );
                    }).toList(),
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
                        }),

              ],
            ),
          ),
        ),

        // Image with precise positioning
        Positioned(
          top: width * 0.24,
          left: width * 0.05,
          right: width * 0.05,
          child: Container(
            width: double.infinity,
            height: height * 0.25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.035),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Back Icon positioned at top: 56px, left: 16px
        Positioned(
          top: width * 0.1,
          left: width * 0.02,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        // Share Icon positioned at top: 56px, right: 16px
        Positioned(
          top: width * 0.1,
          right: width * 0.02,
          child: SizedBox(
            child: IconButton(
              icon: Image.asset("assets/icons/share_icon.png", color: Colors.black, width: 24),
              onPressed: () {
                // Share Functionality
                // Share.share("Check out this donation opportunity: $title\n\n$description");
              },
            ),
          ),
        ),
      ],
    ),
  );
}

}
