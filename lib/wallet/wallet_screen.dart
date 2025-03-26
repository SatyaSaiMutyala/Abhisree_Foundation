import 'package:adhisree_foundation/utils/routes.dart';
import 'package:adhisree_foundation/wallet/wallet_amount.dart';
import 'package:adhisree_foundation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool showTransactions = true; 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(height: height * 0.02),

          // Wallet Title
          Padding(
            padding: EdgeInsets.only(left: width * 0.06),
            child: Text(
              "Wallet",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: width * 0.04,
                color: Theme.of(context).shadowColor.withOpacity(0.8),
              ),
            ),
          ),
          SizedBox(height: height * 0.015),

          // Wallet Amount Widget
          WalletAmountWidget(showTransactions: showTransactions),

          // Transaction & Withdrawal History Toggle
          Container(
            width: width * 2,
            margin: EdgeInsets.only(top: width * 0.06, left: width * 0.08), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showTransactions = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Transaction History",
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.04,
                        color: showTransactions ? Colors.black : Color(0xFFB8B5B5),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showTransactions = false;
                    });
                  },
                  child: Container(
                    width: width * 0.5,
                    alignment: Alignment.center,
                    child: Text(
                      "Withdrawal History",
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.04,
                        color: showTransactions ? Color(0xFFB8B5B5) : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: width * 0.01),

          // Transaction List
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: showTransactions ? buildTransactionList() : buildWithdrawalList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTransactionList() {

    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => {
            Navigator.pushNamed(context, AppRoutes.refferedPaymentScreen),
          },
          child:  Container(
          width: width * 0.4,
          margin: EdgeInsets.only(bottom: width * 0.02),
          padding: EdgeInsets.fromLTRB(width * 0.02, width * 0.03, width * 0.04, width * 0.03),
          decoration: BoxDecoration(
            color: Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date & Time Bar
              Container(
                // width: 322,
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "20-Sep-2024 | 10:30 AM",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6F6B6B),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),

              // Main Transaction Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Name (Srinivas)
                  Container(
                    // width: 70,
                    // height: 21,
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: Text(
                      "Srinivas",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // Amount with Rs symbol
                  Container(
                    // width: 79,
                    // height: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Color(0xFF039200), size: 16),
                        SizedBox(width: 2),
                        Text(
                          "₹25,000",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF039200),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
      },
    );
  }


  Widget buildWithdrawalList() {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height ;
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () => {
          Navigator.pushNamed(context, AppRoutes.withdrawPaymentDetails),
        },
      child: Container(
        margin: EdgeInsets.only(bottom: width * 0.02),
        padding: EdgeInsets.fromLTRB(width * 0.02, width * 0.03, width * 0.04, width * 0.03),
        decoration: BoxDecoration(
          color: Color(0xFFF3F3F3), 
          borderRadius: BorderRadius.circular(10), 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date & Time Bar
            Container(
              width: width * 0.9,
              height: 15, // Updated height
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "20-Sep-2024 | 10:30 AM",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6F6B6B),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.006),

            // Debited To Text & Amount
            Container(
              // width: 322,
              // height: 33,
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // "Debited to" - FLEXIBLE WIDTH
                  Expanded(
                    child: Text(
                      "Debited to",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // ₹25,000 Box (Fixed Size)
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.add, size: 14, color: Color(0xFF039200)),
                        Image.asset('assets/images/Png/success.png', width: width * 0.04),
                        SizedBox(width: width * 0.02),
                        Text(
                          "₹25,000",
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF039200),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Account Number
            Container(
              // width: 322,
              // height: 15,
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Text(
                "xxxxxxxxx34",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6F6B6B),
                ),
              ),
            ),
          ],
        ),
      ));
    },
  );
}






}
