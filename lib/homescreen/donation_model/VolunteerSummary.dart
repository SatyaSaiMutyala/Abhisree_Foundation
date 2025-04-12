import 'dart:convert';

import 'package:adhisree_foundation/controllers/AddVoluntreeController.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Volunteersummary extends StatefulWidget {
  
  Map<String, dynamic> data;

  Volunteersummary({Key? key, required this.data}) : super(key: key);
  
  @override
  _VolunteersummaryState createState() => _VolunteersummaryState();
}

class _VolunteersummaryState extends State<Volunteersummary> {
  final Addvolunteercontroller addvolunteercontroller = Get.put(Addvolunteercontroller());

  
  late int VolunteerAmount;
  late int pgf;
  late int platformFee;
  late int totalAmount;
  
  late Razorpay _razorpay;
  String? userId;
    @override
  void initState() {
    super.initState();

      
    VolunteerAmount = 1000;

    pgf = (VolunteerAmount * 0.02).round();
    platformFee = 10;

    totalAmount = VolunteerAmount + pgf + platformFee;

     _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _loadUserId();

  }

   void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('handleSkipDetails ${response.paymentId}');
    print("Collected Data: ${widget.data}");
   addvolunteercontroller.AddVolunteer('volunteer-create', widget.data);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error: ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet Selected: ${response.walletName}');
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userData = jsonDecode(userJson);
      setState(() {
        userId = userData['id'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     int finalAmount = totalAmount * 100 ;

     var options = {
      'key': 'rzp_test_K2jWf5oO6jmHLb',
      'amount': finalAmount,
      'name': 'Abhisree Foundation',
      'description': 'Become a Volunteer',
      'prefill': {'contact': '9912821123', 'email': 'abhisree@gmail.com'},
    };

    return Scaffold(
        appBar: AppBar(
          title: Text('Review Details'),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
        child : Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: width * 0.07) ,
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Volunteer Membership Entry fee',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '₹$VolunteerAmount',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent,
                        ),
                      )),
                ],
              ),),
              SizedBox(height: height * 0.01),
              Text('AFTER Completion of payment , you will receive offer letter, id card and visiting card',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: width* 0.03,
              ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
             
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Donation Breakup',
                    style: TextStyle(
                        fontSize: width * 0.04, fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Membership Entry fee',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '₹$VolunteerAmount',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Pyment Gateway Fee(2%)',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '₹${pgf}',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Platform fee',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '₹${platformFee}',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                ],
              ),
              SizedBox(height: height * 0.02),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Total',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '₹$totalAmount',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical : width * 0.03),
                child: CustomButton(text: 'PROCEED', onPressed: () => {_razorpay.open(options)} )
              ),
            ],
          ),
        )),
  );}
}
