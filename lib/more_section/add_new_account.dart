import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:adhisree_foundation/widgets/custom_cards.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';
import 'package:adhisree_foundation/widgets/custom_header.dart';

class AddNewAccountScreen extends StatelessWidget {
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountHolderController =
      TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: height * 0.07,
              left: width * 0.25, // Centered dynamically
              child: Container(
                width: width * 0.5,
                height: height * 0.04,
                alignment: Alignment.center,
                child: Text(
                  "Add New Account Details",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.fontSizeExtraLarge,
                    height: 33 / 16, // Line-height equivalent
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Positioned Back Button
            Positioned(
              top: height * 0.065,
              left: width * 0.05,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: width * 0.1,
                  height: height * 0.05,
                  padding:
                      EdgeInsets.fromLTRB(8, 7, 8, 7), // Padding as required
                  decoration: BoxDecoration(
                    color: Color(
                        0XFFEFEEEE), // Background color (Change if needed)
                    shape: BoxShape.circle, // Circular button
                    // border: Border.all(color: Color(0XFF338D9B), width: 2), // Border
                  ),
                  child: Icon(
                    Icons.arrow_back, // Back icon
                    size: width * 0.05, // Adjust size inside container
                    color: Colors.black, // Icon color
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.18,
                  left: 21,
                  right: 21), // Adjusted to prevent overlap
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFieldScreen("Bank Name",
                      keyboardType: TextInputType.name,
                      controller: _bankNameController),
                  SizedBox(height: height * 0.03),
                  textFieldScreen("Account Holder Name",
                      keyboardType: TextInputType.name,
                      controller: _accountHolderController),
                  SizedBox(height: height * 0.03),
                  textFieldScreen("Account Number",
                      keyboardType: TextInputType.name,
                      controller: _accountNameController),
                  SizedBox(height: height * 0.03),
                  textFieldScreen("IFSC Code",
                      keyboardType: TextInputType.name,
                      controller: _ifscController),
                  SizedBox(height: height * 0.03),
                  UploadCard("Upload your passbook"),
                  SizedBox(height: height * 0.06),
                  CustomButton(
                    text: 'Add Bank Details',
                    onPressed: () {
                      // Navigator.pushNamed(context, AppRoutes.OtpScreen);
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
