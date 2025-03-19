import 'package:adhisree_foundation/homescreen/donation_model/volunteer_membership.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/widgets/success_screen.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';

class DonationPopupForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Popup Container
          Container(
            width: 341,
            height: 409,
            padding: EdgeInsets.all(24.26),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView( // ✅ Added scrollable behavior
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),

                  // Title
                  Container(
                    width: 234.24,
                    height: 26,
                    alignment: Alignment.center,
                    child: Text(
                      "ADD DETAILS TO RECEIVE RECEIPT",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 15.16,
                        height: 25.02 / 15.16,
                        letterSpacing: 0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.95),

                  // Name Input
                  textFieldScreen("Name",
                      keyboardType: TextInputType.name,
                      controller: _nameController),
                  SizedBox(height: 9.1),

                  // Pan Input
                  textFieldScreen("Pan",
                      keyboardType: TextInputType.text,
                      controller: _panController),
                  SizedBox(height: 9.1),

                  // Phone Number Input
                  textFieldScreen("Phone Number",
                      keyboardType: TextInputType.phone,
                      controller: _phoneNumberController),
                  SizedBox(height: 24),

                  // Continue Button
                  Center(
                  child: Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFF338D9B),
                      borderRadius: BorderRadius.circular(6.06),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Keeps the container color
                        shadowColor:
                            Colors.transparent, // Removes button shadow
                        padding: EdgeInsets.symmetric(
                            vertical: 8.34, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.06),
                        ),
                      ),
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),

                  SizedBox(height: 10), // Space between buttons

                  // Skip Button
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);

                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(292.48, 26),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 25.02 / 12.13,
                          letterSpacing: 0,
                          color: Color(0XFF338D9B),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Close Button
          Positioned(
            top: 15.76,
            left: 290.43,
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
