import 'package:adhisree_foundation/homescreen/donation_model/donation_modal_screen.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';

class ActiveCampaigns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.07),
          child: Text(
            "Active Campaigns",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: width * 0.05,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: height * 0.02),

        // Active Campaign Card
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Container(
            width: double.infinity,
            height: height * 0.42,
            padding: EdgeInsets.all(width * 0.04),
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(width * 0.04),
              border: Border.all(color: Color(0xFFEDEDED), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Campaign Image
                Container(
                  width: double.infinity,
                  height: height * 0.16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.04),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Png/campaign1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.025),

                // Campaign Title
                Text(
                  "Health Care Support",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.04,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * 0.02),

                // Progress Bar
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.01,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                    ),
                    Container(
                      width: width * 0.4,
                      height: height * 0.01,
                      decoration: BoxDecoration(
                        color: Color(0XFF338D9B),
                        borderRadius: BorderRadius.circular(width * 0.02),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),

                // Donation Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$2,500 Raised",
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF6F6B6B),
                      ),
                    ),
                    Text(
                      "\$20,000 Goal",
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF6F6B6B),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),

                // Donate Now Button
                // SizedBox(
                //   width: double.infinity,
                //   height: 41,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       DonationModalScreen.showDonationPopup(context);
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.white,
                //       side: BorderSide(color: Color(0xFF338D9B), width: 1),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(Dimensions.radiusDefaultExpand),
                //       ),
                //     ),
                //     child: Text(
                //       "Donate Now",
                //       style: TextStyle(
                //         color: Color(0xFF338D9B),
                //         fontFamily: 'Poppins',
                //         fontSize: Dimensions.fontSizeDefault,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.00),
                  child: CustomButton(text: "Donate Now", onPressed: () => DonationModalScreen.showDonationPopup(context), outlined: true, ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

 
}
