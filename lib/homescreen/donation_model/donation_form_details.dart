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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: width * 0.9,
              padding: EdgeInsets.all(width * 0.07),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(width * 0.04),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "ADD DETAILS TO RECEIVE RECEIPT",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 15.16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 18.95),
                    textFieldScreen("Name", keyboardType: TextInputType.name, controller: _nameController),
                    SizedBox(height: 9.1),
                    textFieldScreen("Pan", keyboardType: TextInputType.text, controller: _panController),
                    SizedBox(height: 9.1),
                    textFieldScreen("Phone Number", keyboardType: TextInputType.phone, controller: _phoneNumberController),
                    SizedBox(height: 24),
                    Center(
                      child: CustomButton(
                        text: 'Continue',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SuccessScreen()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0XFF338D9B),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: width * 0.04,
            right: width * 0.04,
            child: Container(
              width: 31.08,
              height: 29.73,
              decoration: BoxDecoration(
                color: Color(0XFFE4E4E4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                icon: Icon(Icons.close, size: 16.22, color: Colors.black),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}