import 'package:adhisree_foundation/homescreen/donation_model/donation_form_details.dart';
import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart'; // Import share package
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
  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView( // Added SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 340), // Adjust space after image

                Text(
                  "Below poverty level students",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),

                // Progress Bar
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 7,
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
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "\$20,000 Goal",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 9),

                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20),

                Text(
                  "School Supplies",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 9),

                Text(
                  "Notebooks, Textbooks, pens, bags, uniforms, and shoes. Helping students who can't afford them.",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20),

                Text(
                  "Select your amount",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),

                // Donation Cards - Horizontally Scrollable
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: donationOptions.map((option) {
                      return Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: DonationPriceCard(
                          amount: option["amount"]!,
                          name: option["name"]!,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),

                // Donate Button
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: 340,
                      height: 53,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return Stack(
                                children: [
                                  Positioned(
                                    top: 233,
                                    left: 25,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: DonationPopupForm(),
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
                ),
              ],
            ),
          ),
        ),

        // Image with precise positioning
        Positioned(
          top: 114,
          left: 23,
          child: Container(
            width: MediaQuery.of(context).size.width -
                  46,
            height: 199,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Back Icon positioned at top: 56px, left: 16px
        Positioned(
          top: 56,
          left: 16,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        // Share Icon positioned at top: 56px, right: 16px
        Positioned(
          top: 56,
          right: 16,
          child: SizedBox(
            width: 40,
            height: 41,
            child: IconButton(
              icon: Icon(Icons.share, color: Colors.black, size: 24),
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
