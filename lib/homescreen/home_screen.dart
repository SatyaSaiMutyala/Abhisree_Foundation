import 'package:adhisree_foundation/homescreen/active_campaigns.dart';
import 'package:adhisree_foundation/homescreen/donation_categories.dart';
import 'package:adhisree_foundation/homescreen/slider_screen.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SizedBox(height: Dimensions.sizedBoxSizeExtrsMedLarge),
            SliderScreen(),
            SizedBox(height: Dimensions.sizedBoxSizeExtraMoreLargeplus),
            DonationCategoryScreen(),
            SizedBox(height: Dimensions.sizedBoxSizeExtraMoreLargeplus),
            ActiveCampaigns(),
            SizedBox(height: 50), // Extra space at the bottom
          ],
        ),
      ),
    );
  }
}
