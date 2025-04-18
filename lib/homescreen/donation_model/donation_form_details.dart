import 'package:adhisree_foundation/controllers/DonationAmountController.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DonationPopupForm extends StatefulWidget {
  final int campaignId;
  final int? priceId;
  final String? amount;
  final String? name;
  final String? image;

  DonationPopupForm(
      {required this.campaignId,
      required this.priceId,
      required this.amount,
      required this.name,
      required this.image});

  @override
  _DonationPopupFormState createState() => _DonationPopupFormState();
}

class _DonationPopupFormState extends State<DonationPopupForm> {
  final Donationamountcontroller donationamountcontroller =
      Get.put(Donationamountcontroller());
  int? userId;
  String? name;
  late Razorpay _razorpay;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userData = jsonDecode(userJson);
      setState(() {
        userId = userData['id'];
        name = userData['first_name'];
        _nameController.text = name ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.028),
      ),
      child: Stack(
        children: [
          Container(
            width: width * 0.9,
            height: height * 0.6,
            padding: EdgeInsets.all(width * 0.058),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.028),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.026),
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
                    _buildCustomTextField(
                        "Name", "Enter your full name", _nameController, width,
                        validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    }),
                    SizedBox(height: height * 0.015),
                    _buildCustomTextField(
                      "PAN",
                      "Enter your PAN number",
                      _panController,
                      width,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'PAN number is required';
                        }
                        final panPattern = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');
                        if (!panPattern.hasMatch(value.trim().toUpperCase())) {
                          return 'Enter a valid PAN number (e.g., ABCDE1234F)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.015),
                    _buildCustomTextField(
                        "Aadhar Number",
                        "Enter your Aadhar number",
                        _aadharController,
                        width, validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Aadhar number is required';
                      }
                      if (value.length != 12) {
                        return 'Enter a valid 12-digit Aadhar number';
                      }
                      return null;
                    }),
                    SizedBox(height: height * 0.03),
                    Center(
                      child: SizedBox(
                        width: width * 0.9,
                        height: height * 0.045,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.34, horizontal: width * 0.038),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.06),
                            ),
                            backgroundColor: Color(0XFF338D9B),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final Map<String, dynamic> args = {
                                'campaignId': widget.campaignId,
                                'amount': widget.amount,
                                'name': widget.name,
                                'image': widget.image,
                                'userName': _nameController.text,
                                'pan': _panController.text,
                                'aadhar': _aadharController.text,
                              };

                              if (widget.priceId != 0) {
                                args['priceId'] = widget.priceId;
                              }

                              Navigator.pushNamed(
                                context,
                                AppRoutes.donationSummary,
                                arguments: args,
                              );
                            }
                          },
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
                    Center(
                      child: TextButton(
                        onPressed: () => {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.donationSummary,
                            arguments: {
                              'campaignId': widget.campaignId,
                              'priceId': widget.priceId,
                              'amount': widget.amount,
                              'name': widget.name,
                              'image': widget.image,
                            },
                          )
                        },
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
          ),
          Positioned(
            top: 9,
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

  Widget _buildCustomTextField(
      String label, String hint, TextEditingController controller, double width,
      {String? Function(String?)? validator}) {
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
        SizedBox(
          width: width * 0.9,
          child: TextFormField(
            controller: controller,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: width * 0.04,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                color: Color(0XFF78797E),
              ),
              filled: true,
              fillColor: Color(0XFFF5F5F5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.06),
                borderSide: BorderSide(color: Color(0XFFE4E4E4)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.06),
                borderSide: BorderSide(color: Color(0XFF338D9B)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.06),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.06),
                borderSide: BorderSide(color: Colors.red),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: width * 0.032,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
