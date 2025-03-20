

import 'package:flutter/material.dart';

class Refferedpaymentscreen extends StatefulWidget {
  @override
  _RefferedPayment createState() => _RefferedPayment();
}

class _RefferedPayment extends State<Refferedpaymentscreen>{
  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Referred details"),
        titleTextStyle: TextStyle(
            fontSize: width * 0.045,
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: width * 0.08, horizontal: width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '20-Sep 2024 | 10 : 30 AM',
                  style: TextStyle(
                    fontSize: width * 0.03,
                    color: Color(0XFF2A2B2D),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/Png/teams1.png',
                  width: width * 0.2,
                  height: height * 0.1,
                ),
                SizedBox(width: width * 0.01),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Prasanth Varma ',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: width * 0.03),
                Icon(Icons.add, color: Color(0xFF039200), size: 16),
                SizedBox(width: width * 0.01),
                Text(
                  '₹25,000',
                  style: TextStyle(
                      fontSize: width * 0.04, color: Color(0XFF039200)),
                )
              ],
            ),
            SizedBox(height: height * 0.025),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Transaction ID',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.006),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '6827485353495673',
                    style: TextStyle(
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'wallet',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Image.asset('assets/images/Png/sbi.png', width: width * 0.13,)
                    Icon(Icons.wallet_rounded, size: width * 0.06 ),
                  ],
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Debited to',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '₹25,000',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}