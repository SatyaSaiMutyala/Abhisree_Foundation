import 'dart:convert';

import 'package:adhisree_foundation/controllers/DonationAmountController.dart';
import 'package:adhisree_foundation/controllers/GetGstDetailsController.dart';
import 'package:adhisree_foundation/controllers/MinimumAmountController.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/snackBar.dart';
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
  final GetgstdetailsController getgstdetailsController =
      Get.put(GetgstdetailsController());
  final Minimumamountcontroller minimumamountcontroller =
      Get.put(Minimumamountcontroller());

  late int donationAmount;
  late int pgf;
  late int platformFee;
  late int totalAmount;
  late Razorpay _razorpay;
  int? userId;
  String? name;
  bool isLoading = true;
  late int gst;
  late String rawAmount;
  bool isPaymentProcessing = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await getgstdetailsController.fetchGstDetails('get-settings-pay');

    gst = getgstdetailsController.gst.value;
    final platformfee = getgstdetailsController.platformFee.value;

    print('Platform ------------>$platformfee');
    print('gst -------------->$gst');

    name = widget.data!['name'];

    rawAmount = widget.data?['amount'] ?? '0';
    double parsedAmount = double.tryParse(rawAmount) ?? 0.0;

    donationAmount = parsedAmount.round();
    // pgf = (donationAmount * 0.02).round();
    pgf = ((donationAmount * gst) / 100).round();

    platformFee = platformfee;
    totalAmount = donationAmount + pgf + platformFee;

    print("Parsed donation amount: $donationAmount");
    print("GST: $pgf, Platform Fee: $platformFee");
    print("Total: $totalAmount");

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    await _loadUserId();
    setState(() {
      isLoading = false;
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print('handleSkipDetails ${response.paymentId}');
    final details = {
      "user_id": userId,
      "name": widget.data!['userName'],
      "price_id": widget.data!['priceId'],
      "campaign_id": widget.data!['campaignId'],
      "pan": widget.data!['pan'],
      "aadhar": widget.data!['aadhar'],
      "transction_details": response.paymentId,
      "price": widget.data!['amount'],
      'price_name': widget.data!['name'],
      'email': widget.data!['email'],
      'status': 'sucuss'
    };

    final recipitData = {
      "user_id": userId,
      "user_name": name,
      "trans_id": response.paymentId,
      "type": "volunteer",
      "money": rawAmount,
      "gst": gst,
      "platform_fee": platformFee,
      "total_money": totalAmount,
      "pan": widget.data!['pan'],
    };

    print("Collected Data: $details");
    await donationamountcontroller.DonateAmount('send_donot_donation', details);
    await minimumamountcontroller.VolunteerAmount(
        "store-emp-vol-money", recipitData);

    if (mounted) {
      setState(() {
        isPaymentProcessing = false;
      });
    }
  }

  // void _handlePaymentError(PaymentFailureResponse response) {
  //   print('Payment Error: ${response.message}');
  // }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error: ${response.message}');
    if (response.code == 2) {
      // Payment cancelled by user
      Get.snackbar(
        'Payment Cancelled',
        'You exited the payment without completing it.',
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
      // showErrorSnackbar('You exited the payment without completing it.');
    } else {
      Get.snackbar(
        'Payment Failed',
        'Something went wrong. Please try again.',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    if (mounted) {
      setState(() {
        isPaymentProcessing = false;
      });
    }
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
  void dispose() {
    _razorpay.clear(); // Clean up listeners
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Review Details'),
          backgroundColor: Colors.white,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int finalAmount = totalAmount * 100;
    var options = {
      'key': 'rzp_live_tUZZmaJRY6f2od',
      'amount': finalAmount,
      'name': 'Abhisree Foundation',
      'description': name,
      'prefill': {'contact': '', 'email': 'abhisree@gmail.com'},
    };

    return Stack(
      children: [
        Scaffold(
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
                        child: Image.network(widget.data!['image'],
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
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
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
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
                            'Payment GateWay($gst%)',
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
                  Divider(color: Colors.grey),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: width * 0.03),
                    child: CustomButton(
                        text: 'PROCEED',
                        onPressed: () {
                          setState(() {
                            isPaymentProcessing = true;
                          });
                          _razorpay.open(options);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Loading Overlay
        if (isPaymentProcessing)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: width * 0.65,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.payment,
                        size: width * 0.12, color: Color(0XFF338D9B)),
                    SizedBox(height: height * 0.018),
                    SizedBox(
                      width: width * 0.5,
                      child: LinearProgressIndicator(
                        color: Color(0XFF338D9B),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    SizedBox(height: height * 0.018),
                    Text(
                      'Processing payment...',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
