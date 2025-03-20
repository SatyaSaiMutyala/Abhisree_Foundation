import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/widgets/custom_cards.dart';
import 'package:adhisree_foundation/widgets/success_screens.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';

class VolunteerMembership extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _aadharNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get device width & height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Back Button
            Positioned(
              top: height * 0.03, // Adjusted for better alignment
              left: width * 0.05,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: width * 0.1,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: Color(0XFFEFEEEE), // Background color
                    shape: BoxShape.circle, // Circular button
                  ),
                  child: Icon(
                    Icons.arrow_back, // Back icon
                    size: width * 0.05, // Adjust size inside container
                    color: Colors.black, // Icon color
                  ),
                ),
              ),
            ),

            Positioned(
              top: height * 0.03, // 56px from the top
              left: width * 0.79, // 326px from the left
              child: Container(
                width: width * 0.11,
                height: height * 0.04,
                alignment: Alignment.center,
                child: Text(
                  'Help ?', // Display "HELP" text
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.034,
                    height: 33 / 14, // Equivalent to line-height: 33px
                    letterSpacing: 0,
                    color: Colors.black, // White text color for contrast
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Scrollable Content
            SingleChildScrollView(
              physics: BouncingScrollPhysics(), // Smooth scrolling effect
              padding: EdgeInsets.all(width * 0.052),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.08), // Space for back button

                  // Title Text
                  Container(
                    width: double.infinity, // Takes full width
                    child: Text(
                      'Volunteer Membership Enrollment Form',
                      style: TextStyle(
                        fontSize: width * 0.049,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                      softWrap: true, // Allows text to wrap to the next line
                    ),
                  ),

                  SizedBox(
                      height:
                          width * 0.02), // Space between title & description

                  // Description
                  Text(
                    'Interested user must complete the membership form and pay a nominal fee of ₹1,000',
                    style: TextStyle(
                        fontSize: width * 0.034,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF6F6B6B)),
                  ),

                  SizedBox(height: height * 0.045),

                  UploadCard("Upload your photo"),
                  SizedBox(height: height * 0.03),

                  UploadCard("Upload your Aadhar photo"),
                  SizedBox(height: height * 0.03),

                  textFieldScreen("First Name",
                      keyboardType: TextInputType.name,
                      controller: _firstNameController),
                  SizedBox(height: height * 0.03),
                  textFieldScreen("Last Name",
                      keyboardType: TextInputType.name,
                      controller: _lastNameController),
                  SizedBox(height: height * 0.03),
                  textFieldScreen("Email",
                      keyboardType: TextInputType.name,
                      controller: _emailController),
                  SizedBox(height: height * 0.03),
                  textFieldScreen("Pan",
                      keyboardType: TextInputType.name,
                      controller: _panController),
                  SizedBox(height: height * 0.03),
                  textFieldScreen("Aadhar Number",
                      keyboardType: TextInputType.name,
                      controller: _aadharNumberController),
                  SizedBox(height: height * 0.03),
                  textFieldScreen("Address",
                      keyboardType: TextInputType.name,
                      controller: _addressController),
                  SizedBox(height: height * 0.03),
                  textFieldScreen("Referral Code",
                      keyboardType: TextInputType.name,
                      controller: _referralCodeController),
                  SizedBox(height: height * 0.06),
                  CustomButton(
                    text: 'Continue',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreens()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
