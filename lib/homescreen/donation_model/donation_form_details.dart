import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';

class DonationPopupForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.028),
      ),
      child: Stack(
        children: [
          Container(
            width: width * 0.9,
            height: height * 0.5,
            padding: EdgeInsets.all(width * 0.058),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.028),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.026), // Space for close button

                  // Title
                  Text(
                    "Add details to receive receipt",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.015),

                  // Name Input
                  _buildCustomTextField("Name", "Enter your full name", _nameController, width),
                  SizedBox(height: height * 0.015),
                  _buildCustomTextField("PAN", "Enter your PAN number", _panController, width),
                  SizedBox(height: height * 0.015),
                  _buildCustomTextField("Phone Number", "Enter your phone number", _phoneNumberController, width),
                  SizedBox(height: height * 0.03),

                  // Continue Button
                  Center(
                    child: Container(
                      width: width * 0.9,
                      height: height * 0.045,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 8.34, horizontal: width * 0.038),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.06),
                          ),
                          backgroundColor: Color(0XFF338D9B),
                        ),
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.successScreen),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: width * 0.034,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.005),

                  // Skip Button
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.034,
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
            top: 9,
            // left: 301,
            right: 10,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 31.08,
                height: 29.73,
                decoration: BoxDecoration(
                  color: Color(0xFFE6E6E6),
                  borderRadius: BorderRadius.circular(18.92),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black54,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom Text Field
    // Custom Text Field
  Widget _buildCustomTextField(String label, String hint, TextEditingController controller, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.035,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: width * 0.01),
        Container(
          width: width * 0.9,  // Now using width properly
          height: width * 0.09, // Adjusted height
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: width * 0.03,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                color: Color(0XFF78797E),
              ),
              filled: true,
              fillColor: Color(0XFFF5F5F5), // Background color

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.06),
                borderSide: BorderSide(color: Color(0XFFE4E4E4)),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.06),
                borderSide: BorderSide(color: Color(0XFF338D9B)),
              ),

              contentPadding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: width * 0.015),
            ),
          ),
        ),
      ],
    );
  }
}
