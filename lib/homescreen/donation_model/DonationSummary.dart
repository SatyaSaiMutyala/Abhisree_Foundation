import 'dart:convert';

import 'package:adhisree_foundation/controllers/DonationAmountController.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Donationsummary extends StatefulWidget {
  Map<String, dynamic>? data;

  Donationsummary({Key? key, required this.data}) : super(key: key);

  @override
  _DonationsummaryState createState() => _DonationsummaryState();
}

class _DonationsummaryState extends State<Donationsummary> {
  final Donationamountcontroller donationamountcontroller =
      Get.put(Donationamountcontroller());

  late int donationAmount;
  late int pgf;
  late int platformFee;
  late int totalAmount;
  late Razorpay _razorpay;
  int? userId;
  String? name;

  @override
  void initState() {
    super.initState();

    name = widget.data!['name'];

    final rawAmount = widget.data?['amount'] ?? '0';
    double parsedAmount = double.tryParse(rawAmount) ?? 0.0;

    donationAmount = parsedAmount.round();

    pgf = (donationAmount * 0.02).round();
    platformFee = 10;

    totalAmount = donationAmount + pgf + platformFee;

    print("Parsed donation amount: $donationAmount");
    print("GST: $pgf, Platform Fee: $platformFee");
    print("Total: $totalAmount");
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _loadUserId();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('handleSkipDetails ${response.paymentId}');
    final details = {
      "user_id": userId,
      "name": widget.data!['userName'],
      "price_id": widget.data!['priceId'],
      "campaign_id": widget.data!['campaignId'],
      "pan": widget.data!['pan'],
      "aadhar": widget.data!['aadhar'],
      "transction_details": response.paymentId,
      "price" : widget.data!['amount'],
      'price_name' : widget.data!['name'],
    };

    print("Collected Data: $details");
    donationamountcontroller.DonateAmount('send_donot_donation', details);
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
      'description': name,
      'prefill': {'contact': '9912821123', 'email': 'abhisree@gmail.com'},
    };

    return Scaffold(
        appBar: AppBar(
          title: Text('Review Details'),
          backgroundColor: Colors.white,
        ),
        body: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: width * 0.03),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: double.infinity,
                        height: width * 0.5,
                        // child: Image.asset(
                        //   'assets/images/Png/child.png',
                        //   fit: BoxFit.cover,
                        // ),
                        child: Image.network(widget.data!['image'],
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Below Poverty Level students',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          widget.data!['name'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '₹$donationAmount',
                          textAlign: TextAlign.end,
                          style : TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                        ),
                        
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Donation Breakup',
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Text(
                            'Donation',
                            style: TextStyle(
                              fontSize: width * 0.04,
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            '₹$donationAmount',
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
                            'Payment GateWay(2%)',
                            style: TextStyle(
                              fontSize: width * 0.04,
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            '₹$pgf',
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
                            '₹$platformFee',
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
                    child: CustomButton(
                        text: 'PROCEED',
                        onPressed: () => { _razorpay.open(options)} ),
                  ),
                ],
              ),
            )));
  }
}
