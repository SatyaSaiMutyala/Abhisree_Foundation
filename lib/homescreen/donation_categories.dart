import 'package:flutter/material.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';

class DonationCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: Dimensions.paddingSizeExtraLargeFix),
            child: Text(
              "Donation Categories",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.fontSizeLarge,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: Dimensions.sizedBoxSizeDefault),

          // Education Category Card
          Padding(
            padding: EdgeInsets.only(left: Dimensions.paddingSizeExtraLargeFix),
            child: Container(
              width: 115,
              height: 92,
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.paddingSizeSmall,
                horizontal: Dimensions.paddingSizeLarge,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(Dimensions.radiusDefaultExpand),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school, 
                    size: Dimensions.iconSizeDoubleExtraLarge, 
                    color: Colors.black
                  ),
                  SizedBox(height: Dimensions.sizedBoxSizeExtraSmall),
                  Text(
                    "Education",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: Dimensions.fontSizeDefault,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).shadowColor.withOpacity(0.8),
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
