import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';

class DonationPopupForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Popup Container
          Container(
            width: width * 0.9,
            height: height * 0.66,
            padding: EdgeInsets.all(width * 0.07),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.01),

                // Title
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Add details to receive receipt",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: width * 0.045,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.025),

                // Name Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldScreen("Name", controller: _nameController, keyboardType: TextInputType.name),
                  ],
                ),
                SizedBox(height: height * 0.02),

                // Email Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldScreen("Pan", controller: _panController, keyboardType: TextInputType.number),
                  ],
                ),
                SizedBox(height: height * 0.02),

                // Donation Amount Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldScreen("Phone Number", controller: _phoneNumberController, keyboardType: TextInputType.number),
                  ],
                ),
                SizedBox(height: height * 0.03),

                // Continue Button
                Center(
                  child:  CustomButton(text: 'Countinue', onPressed: () => Navigator.pushNamed(context, AppRoutes.successScreen)),
                ),

                SizedBox(height: height * 0.01), 

// Skip Button
                Center(
                  child: TextButton(
                    onPressed: () {
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, 
                      minimumSize: Size(292.48, 26), 
                      tapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, 
                    ),
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.035,
                        color: Color(0XFF338D9B), 
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Close Button with Background
          Positioned(
            top: width * 0.04,
            // left: 290.43,
            right: width * 0.04,
            child: Container(
              width: 31.08,
              height: 29.73,
              decoration: BoxDecoration(
                color: Color(0XFFE4E4E4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.close, size: 16.22, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
