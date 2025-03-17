import 'package:adhisree_foundation/homescreen/donation_model/donation_modal_screen.dart';
import 'package:flutter/material.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';

class ActiveCampaigns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Dimensions.paddingSizeExtraLargeFix),
          child: Text(
            "Active Campaigns",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: Dimensions.fontSizeLarge,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: Dimensions.sizedBoxSizeDefault),

        // Active Campaign Card
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
          child: Container(
            width: double.infinity,
            height: 289,
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xFFEDEDED), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Campaign Image
                Container(
                  width: double.infinity,
                  height: 127,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                    image: DecorationImage(
                      image: AssetImage('assets/campaign1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.sizedBoxSizeSmall),

                // Campaign Title
                Text(
                  "Health Care Support",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.fontSizeSmall,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),

                // Progress Bar
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0XFF338D9B),
                        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.sizedBoxSizeSmall),

                // Donation Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$2,500 Raised",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "\$20,000 Goal",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: Dimensions.fontSizeSmall,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.sizedBoxSizeSmall),

                // Donate Now Button
                SizedBox(
                  width: double.infinity,
                  height: 41,
                  child: ElevatedButton(
                    onPressed: () {
                      DonationModalScreen.showDonationPopup(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Color(0xFF338D9B), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.radiusDefaultExpand),
                      ),
                    ),
                    child: Text(
                      "Donate Now",
                      style: TextStyle(
                        color: Color(0xFF338D9B),
                        fontFamily: 'Poppins',
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

 
}
