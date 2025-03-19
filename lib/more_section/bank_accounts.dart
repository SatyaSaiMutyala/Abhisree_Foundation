import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BankDetailsScreen extends StatefulWidget {
  final String bankName;

  BankDetailsScreen({
    required this.bankName,
  });

  @override
  _BankDetailsScreenState createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  bool isPrimary = false;
  String accountHolder = "Prasad";
  String accountNo = "68023820893";
  String ifscCode = "DFB0077";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: height * 0.07,
            left: width * 0.35, // Centered dynamically
            child: Container(
              width: width * 0.3,
              height: height * 0.04,
              alignment: Alignment.center,
              child: Text(
                "Bank Details",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.fontSizeExtraLarge,
                  height: 33 / 16, // Line-height equivalent
                  letterSpacing: 0,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Positioned Back Button
          Positioned(
            top: height * 0.065,
            left: width * 0.05,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: width * 0.1,
                height: height * 0.05,
                padding: EdgeInsets.fromLTRB(8, 7, 8, 7), // Padding as required
                decoration: BoxDecoration(
                  color:
                      Color(0XFFEFEEEE), // Background color (Change if needed)
                  shape: BoxShape.circle, // Circular button
                  // border: Border.all(color: Color(0XFF338D9B), width: 2), // Border
                ),
                child: Icon(
                  Icons.arrow_back, // Back icon
                  size: width * 0.05, // Adjust size inside container
                  color: Colors.black, // Icon color
                ),
              ),
            ),
          ),
          Positioned(
            left: width * 0.05, // Left padding
            top: height * 0.16, // Top padding
            child: Container(
              width: width * 0.9,
              height: height * 0.39,
              padding: EdgeInsets.symmetric(horizontal: width * 0.026, vertical: height * 0.028),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(Dimensions.radiusDefaultExpand),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bank Icon, Account Number, and Bank Name
                  Row(
                    children: [
                      // Icon
                      Container(
                        width: width * 0.125, // Increased width
                        height: height * 0.06, // Increased height
                        child: Center(
                          child: Image.asset(
                            "assets/icons/sbi_icon.png",
                            width: width * 0.125, // Increased icon width
                            height: height * 0.06, // Increased icon height
                            color: Colors.blue,
                            fit: BoxFit
                                .contain, // Ensures the image fits well inside the container
                          ),
                        ),
                      ),

                      SizedBox(width: width * 0.025), // Gap between icon and text

                      // Account Number & Bank Name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "XXXXXXXX893", // Masked account number
                            style: TextStyle(
                              fontSize: width * 0.034,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 2), // Small spacing
                          Text(
                            widget.bankName,
                            style: TextStyle(
                              fontSize: width * 0.028,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.023),

// Bank Details: Titles and values aligned from start
                  _buildDetailRow("Bank", widget.bankName),
                  _buildDetailRow("Holder name", accountHolder),
                  _buildDetailRow("Account No", accountNo),
                  _buildDetailRow("IFSC", ifscCode),


// Set as Primary Account
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Set as primary account",
                          style: TextStyle(
                            fontSize: width * 0.034,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            color: Color(0xFF039200),
                          ),
                        ),
                      ),
                      Radio(
                        value: true,
                        groupValue: isPrimary,
                        activeColor: Color(0xFF039200),
                        onChanged: (value) {
                          setState(() {
                            isPrimary = value as bool;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// Method for Bank Details Row
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.5),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Ensures both parts start from left
        children: [
          Expanded(
            flex: 2, // Adjust width ratio (Title part)
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                color: Color(0XFF6F6B6B),
              ),
            ),
          ),
          Expanded(
            flex: 3, // Adjust width ratio (Value part)
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
