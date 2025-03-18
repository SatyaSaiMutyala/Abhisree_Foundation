import 'package:flutter/material.dart';

class BankDetailsScreen extends StatefulWidget {
  final String bankName;
  final String accountHolder;
  final String accountNo;
  final String ifscCode;

  BankDetailsScreen({
    required this.bankName,
    required this.accountHolder,
    required this.accountNo,
    required this.ifscCode,
  });

  @override
  _BankDetailsScreenState createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  bool isPrimary = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bank Details")),
      body: Stack(
        children: [
          Positioned(
            left: 21, // Left padding
            top: 137, // Top padding
            child: Container(
              width: 350,
              height: 334,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Labels align left
                children: [
                  // Bank Icon and Name in one row
                  Row(
                    children: [
                      Icon(Icons.account_balance, size: 40, color: Colors.blue),
                      SizedBox(width: 10),
                      Text(widget.bankName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Bank Details: Labels start from left, values centered
                  _buildDetailRow("Bank", widget.bankName),
                  _buildDetailRow("Holder Name", widget.accountHolder),
                  _buildDetailRow("Account No", widget.accountNo),
                  _buildDetailRow("IFSC", widget.ifscCode),

                  SizedBox(height: 20),

                  // Radio Button for Primary Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Set as Primary Account", style: TextStyle(fontSize: 16, color: Color(0XFF039200), fontWeight: FontWeight.bold)),
                      Radio(
                        value: true,
                        groupValue: isPrimary,
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

  // Labels start from left, values in center
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2, // Label takes less space
            child: Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[700])),
          ),
          Expanded(
            flex: 3, // Value takes more space and is centered
            child: Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Align values to center
            ),
          ),
        ],
      ),
    );
  }
}
