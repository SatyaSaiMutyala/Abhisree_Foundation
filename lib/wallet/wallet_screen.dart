import 'package:adhisree_foundation/wallet/wallet_amount.dart';
import 'package:adhisree_foundation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool showTransactions = true; // Toggle between Transaction and Withdrawal History

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(height: 16),

          // Wallet Title
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "Wallet",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Theme.of(context).shadowColor.withOpacity(0.8),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Wallet Amount Widget
          WalletAmountWidget(),

          // Transaction & Withdrawal History Toggle
          Container(
            width: 350,
            height: 29,
            margin: EdgeInsets.only(top: 25, left: 22), // Positioned as per requirement
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
                    width: 165,
                    height: 29,
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(5),
                    //   color: showTransactions ? Colors.black : Colors.transparent,
                    // ),
                    child: Text(
                      "Transaction History",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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
                    width: 165,
                    height: 29,
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(5),
                    //   color: showTransactions ? Colors.transparent : Colors.black,
                    // ),
                    child: Text(
                      "Withdrawal History",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: showTransactions ? Color(0xFFB8B5B5) : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Line Divider
          Container(
            width: 350,
            margin: EdgeInsets.only(top: 10, left: 22), // Aligning with toggle
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFDEDEDE), width: 1),
              ),
            ),
          ),

          SizedBox(height: 16),

          // Transaction List
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: showTransactions ? buildTransactionList() : buildWithdrawalList(),
            ),
          ),
        ],
      ),
    );
  }

  // Transaction History List
    // Transaction History List
    // Transaction History List
    // Transaction History List
  Widget buildTransactionList() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          width: 354,
          height: 72,
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.fromLTRB(4, 14, 4, 4),
          decoration: BoxDecoration(
            color: Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date & Time Bar
              Container(
                width: 322,
                height: 21,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "20-Sep-2024 | 10:30 AM",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6F6B6B),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),

              // Main Transaction Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Name (Srinivas)
                  Container(
                    width: 70,
                    height: 21,
                padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Srinivas",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // Amount with Rs symbol
                  Container(
                    width: 79,
                    height: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Color(0xFF039200), size: 16),
                        SizedBox(width: 2),
                        Text(
                          "₹25,000",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
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
        );
      },
    );
  }


  Widget buildWithdrawalList() {
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (context, index) {
      return Container(
        width: 354,
        height: 86, // Card size
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.fromLTRB(4, 14, 4, 4), // Padding
        decoration: BoxDecoration(
          color: Color(0xFFF3F3F3), // Background color
          borderRadius: BorderRadius.circular(3), // Border radius
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date & Time Bar
            Container(
              width: 322,
              height: 15, // Updated height
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "20-Sep-2024 | 10:30 AM",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6F6B6B),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),

            // Debited To Text & Amount
            Container(
              width: 322,
              height: 33,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // "Debited to" - FLEXIBLE WIDTH
                  Expanded(
                    child: Text(
                      "Debited to",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // ₹25,000 Box (Fixed Size)
                  Container(
                    width: 79,
                    height: 18,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 14, color: Color(0xFF039200)),
                        SizedBox(width: 2),
                        Text(
                          "₹25,000",
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 14,
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
              width: 322,
              height: 15,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "xxxxxxxxx34",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6F6B6B),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}






}
