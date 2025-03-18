import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';

class AddNewAccountScreen extends StatelessWidget {
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountHolderController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Account Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textFieldScreen("Bank Name", keyboardType: TextInputType.name),
            SizedBox(height: 12),
            textFieldScreen("Account Holder Name", keyboardType: TextInputType.name),
            SizedBox(height: 12),
            textFieldScreen("Account Name", keyboardType: TextInputType.name),
            SizedBox(height: 12),
            textFieldScreen("IFSC Code", keyboardType: TextInputType.name),
            SizedBox(height: 20),
            _buildUploadCard(context), // Pass context here
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add bank details logic here
                },
                child: Text("Add Bank Details"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadCard(BuildContext context) { // Receive context here
    return Container(
      width: MediaQuery.of(context).size.width - 21, // Now context is accessible
      height: 137,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0XFFE4E4E4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0XFFE4E4E4)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.insert_drive_file, size: 40, color: Colors.blue),
          SizedBox(height: 8),
          Text("JPG, PNG", style: TextStyle(color: Colors.grey)),
          SizedBox(height: 8),
          Text("Upload your passbook", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
