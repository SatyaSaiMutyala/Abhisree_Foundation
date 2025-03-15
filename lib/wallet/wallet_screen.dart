import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SizedBox(height: Dimensions.sizedBoxSizeDefault),

            // Active Campaigns Title
            Padding(
              padding: EdgeInsets.only(left: Dimensions.paddingSizeExtraLargeFix),
              child: Text(
                "Wallet",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.fontSizeLarge,
                  color: Theme.of(context).shadowColor.withOpacity(0.8),
                ),
              ),
            ),
            SizedBox(
  height: 450, // Provide a defined height
  child: Stack(
    children: [
      Positioned(
        top: 10, // Adjust so it fits within the available space
        left: 24,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21.18),
          ),
          elevation: 2, // Adjusted to match the subtle shadow effect
          shadowColor: Color(0x171A1F1F), // Shadow color
          color: Color(0xFFDAF6FA), // Background color
          child: Container(
            width: 354,
            height: 144,
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              "\$500.00",
              style: TextStyle(
                fontSize: 32, // Adjusted for emphasis
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    ],
  ),
),




            SizedBox(height: 20),
            Text(
              "Recent Transactions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.arrow_downward, color: Colors.red),
                    title: Text("Transaction #${index + 1}"),
                    subtitle: Text("12 March 2025"),
                    trailing: Text("-\$20.00", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}
