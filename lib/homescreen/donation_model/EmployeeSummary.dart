import 'dart:convert';

import 'package:adhisree_foundation/controllers/AddEmployeeController.dart';
import 'package:adhisree_foundation/controllers/GetGstDetailsController.dart';
import 'package:adhisree_foundation/controllers/MinimumAmountController.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Employeesummary extends StatefulWidget {
  Map<String, dynamic> data;

  Employeesummary({Key? key, required this.data}) : super(key: key);

  @override
  _EmployeesummaryState createState() => _EmployeesummaryState();
}

class _EmployeesummaryState extends State<Employeesummary> {
  // final Addvolunteercontroller addvolunteercontroller = Get.put(Addvolunteercontroller());
  final Addemployeecontroller addemployeecontroller =
      Get.put(Addemployeecontroller());

  final GetgstdetailsController getgstdetailsController =
      Get.put(GetgstdetailsController());
  final Minimumamountcontroller minimumamountcontroller =
      Get.put(Minimumamountcontroller());

  late String name;
  late String pan;
  late int employeePayment;
  late int pgf;
  late int platformFee;
  late int totalAmount;
  late int Gst;
  bool isLoading = true;
  bool isPaymentProcessing = false;

  late Razorpay _razorpay;
  String? userId;
  @override
  void initState() {
    super.initState();
    initilizeData();
  }

  void initilizeData() async {
    await getgstdetailsController.fetchGstDetails('get-settings-pay');
    Gst = getgstdetailsController.gst.value;
    employeePayment = getgstdetailsController.employeePayment.value;
    final platform = getgstdetailsController.platformFee.value;

    name = widget.data['first_name'];
    pan = widget.data['pan'];

    print('********$Gst ************$platform ***************$employeePayment');

    pgf = ((employeePayment * Gst) / 100).round();
    platformFee = platform;

    totalAmount = employeePayment + pgf + platformFee;

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _loadUserId();
    setState(() {
      isLoading = false;
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print('handleSkipDetails ${response.paymentId}');
    print("Collected Data: ${widget.data}");

    final recipitData = {
      "user_id": userId,
      "user_name": name,
      "trans_id": response.paymentId,
      "type": "employee",
      "money": employeePayment,
      "gst": Gst,
      "platform_fee": platformFee,
      "total_money": totalAmount,
      "pan": pan
    };
    await addemployeecontroller.Addemployee('employee/create', widget.data);
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
        userId = userData['id'].toString();
      });
    }
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
      'description': 'Become a Volunteer',
      'prefill': {'contact': '9912821123', 'email': 'abhisree@gmail.com'},
    };

    return Stack(children: [
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
                    padding: EdgeInsets.only(top: width * 0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 4,
                            child: Text(
                              'Employee Donation',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              '₹$employeePayment',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueAccent,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'AFTER Completion of payment , you will receive offer letter, id card and visiting card',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: width * 0.03,
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
                            '₹$employeePayment',
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
                            'Pyment Gateway Fee($Gst%)',
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
            )),
      ),
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
    ]);
  }
}
