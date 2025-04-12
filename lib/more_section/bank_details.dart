import 'dart:convert';

import 'package:adhisree_foundation/controllers/GetBankDetailsController.dart';
import 'package:adhisree_foundation/more_section/add_new_account.dart';
import 'package:adhisree_foundation/more_section/bank_accounts.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottomNav/bottom_nav_bar.dart';

class BankAccountsScreen extends StatefulWidget {
  @override
  _BankAccountScreenState createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountsScreen> {
  final BankDetailsController bankDetailsController =
      Get.put(BankDetailsController());

  int? userId;

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
      });
    }

    bankDetailsController.fetchBankDetails(userId.toString());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: height * 0.1,
        title: Text(
          "Bank Details",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.fontSizeExtraLarge,
            height: 33 / 16,
            color: Colors.black,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: width * 0.038),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.offAll(() => BottomNavScreen(initialPageIndex: 4)),
          ),
        ),
      ),
      body: Obx(() {
        if (bankDetailsController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              _buildAddAccountButton(context, width, height),
              SizedBox(height: height * 0.02),
              Expanded(child: _buildBankListView(context, width, height)),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildAddAccountButton(
      BuildContext context, double width, double height) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddNewAccountScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        height: height * 0.07,
        decoration: BoxDecoration(
          color: Color(0xFFDAF6FA),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Color(0xFF338D9B), size: width * 0.06),
            SizedBox(width: width * 0.02),
            Text(
              "Add New Account",
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankListView(BuildContext context, double width, double height) {
    final banks = bankDetailsController.bankDetails;

    return ListView.builder(
      itemCount: banks.length,
      itemBuilder: (context, index) {
        final bank = banks[index];
        return _buildBankAccountCard(context, bank.bankName, bank.accountNumber,
            bank.holderName, bank.ifsc, width, height);
      },
    );
  }

  Widget _buildBankAccountCard(
      BuildContext context,
      String bankName,
      String acNumber,
      String holderName,
      String ifsc,
      double width,
      double height) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BankDetailsScreen(
                    bankName: bankName,
                    acNumber: acNumber,
                    holderName: holderName,
                    ifsc: ifsc),
              ),
            );
          },
          child: Container(
            width: width * 0.9,
            height: height * 0.078,
            padding: EdgeInsets.all(width * 0.0125),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              border: Border.all(color: Color(0xFFE3DFDF), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: Dimensions.radiusSmall,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Row(
                  children: [
                    // Image.asset("assets/icons/sbi_icon.png",
                    //     width: width * 0.1, height: height * 0.05),
                    Icon(
                      Icons.account_balance,
                      size: width * 0.06,
                      color: Colors.black, // or any color you prefer
                    ),
                    SizedBox(width: width * 0.025),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bankName,
                          style: TextStyle(
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // if (isPrimary)
                        //   Text(
                        //     "Primary",
                        //     style: TextStyle(
                        //         fontSize: width * 0.03,
                        //         color: Color(0XFF039200)),
                        //   ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward,
                    size: width * 0.06, color: Colors.black),
              ],
            ),
          ),
        ),
        SizedBox(height: height * 0.025),
      ],
    );
  }
}
