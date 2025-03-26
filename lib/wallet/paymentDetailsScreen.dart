import 'package:flutter/material.dart';

class Paymentdetailsscreen extends StatefulWidget {
  @override
  _PaymentDetails createState() => _PaymentDetails();
}

class _PaymentDetails extends State<Paymentdetailsscreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Successfully received"),
        titleTextStyle: TextStyle(
            fontSize: width * 0.045,
            fontFamily: "Poppins",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Details',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Color(0XFF000000),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '20-Sep 2024 | 10 : 30 AM',
                  style: TextStyle(
                    fontSize: width * 0.03,
                    color: Color(0XFF2A2B2D),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.01),
            Divider(
              color: Colors.grey,
              thickness: 1,
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
                SizedBox(width: width * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prasanth Varma ',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'XXXXXXXXX546',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: width * 0.03),
                Image.asset(
                  'assets/images/Png/success.png',
                  width: width * 0.05,
                ),
                SizedBox(width: width * 0.02),
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
                      fontWeight: FontWeight.w500,
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
                      fontFamily: "Inter",
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
                // Inside Row
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Ensures left alignment
                  children: [
                    Text(
                      'Bank name',
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: height * 0.006),
                    Text(
                      'State Bank of India',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Image.asset(
                      'assets/images/Png/sbi.png',
                      width: width * 0.13,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Debited to',
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: height * 0.006),
                    Text(
                      'xxxxxxxxx34',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400,
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
                        fontWeight: FontWeight.w800,
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
