import 'package:adhisree_foundation/more_section/bank_accounts.dart';
import 'package:flutter/material.dart';

class BankAccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Bank Accounts")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildBankAccountCard(context, "State Bank of India", "1234567890", "SBIN0001234"),
            SizedBox(height: 10),
            _buildBankAccountCard(context, "HDFC Bank", "0987654321", "HDFC0005678"),
          ],
        ),
      ),
    );
  }

  Widget _buildBankAccountCard(BuildContext context, String bankName, String accountNo, String ifsc) {
    return GestureDetector(
      onTap: () {
        // Navigate to BankDetailsScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BankDetailsScreen(
              bankName: bankName,
              accountHolder: "Prasad",
              accountNo: accountNo,
              ifscCode: ifsc,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 42,
        height: 66,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: Color(0xFFE3DFDF), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/teams_icon.png", width: 40, height: 40), // Replace with actual bank icon
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(bankName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("Primary (Recent Account)", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}


// import 'package:adhisree_foundation/more_section/add_new_account.dart';
// import 'package:flutter/material.dart';

// class BankAccountsScreen extends StatelessWidget {
//   final List<String> bankAccounts = []; // Empty list means no accounts available

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Available Bank Accounts")),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: bankAccounts.isEmpty ? _buildNoBankAccountView(context) : _buildBankListView(context),
//       ),
//     );
//   }

//   Widget _buildBankListView(BuildContext context) {
//     return Column(
//       children: List.generate(bankAccounts.length, (index) => _buildBankAccountCard(context)),
//     );
//   }

//   Widget _buildNoBankAccountView1() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 73,
//             height: 72,
//             decoration: BoxDecoration(
//               color: Color(0xFFDAF6FA),
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: Container(
//                 width: 44,
//                 height: 48,
//                 // decoration: BoxDecoration(
//                 //   shape: BoxShape.circle,
//                 //   border: Border.all(color: Color(0xFF338D9B), width: 2),
//                 // ),
//                 child: Icon(Icons.add, size: 28, color: Color(0xFF338D9B)),
//               ),
//             ),
//           ),
//           SizedBox(height: 12),
//           Text(
//             "Add New Account",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 6),
//           Text(
//             "Add your bank details for your withdrawals",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNoBankAccountView(BuildContext context) {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AddNewAccountScreen()),
//             );
//           },
//           child: Container(
//             width: 73,
//             height: 72,
//             decoration: BoxDecoration(
//               color: Color(0xFFDAF6FA),
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: Container(
//                 width: 44,
//                 height: 48,
//                 child: Icon(Icons.add, size: 28, color: Color(0xFF338D9B)),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 12),
//         Text(
//           "Add New Account",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 6),
//         Text(
//           "Add your bank details for your withdrawals",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//       ],
//     ),
//   );
// }


//   Widget _buildBankAccountCard(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width - 42,
//       height: 66,
//       padding: EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(2),
//         border: Border.all(color: Color(0xFFE3DFDF), width: 1),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset("assets/teams_icon.png", width: 40, height: 40),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "State Bank of India",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "Primary (Recent Account)",
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
//         ],
//       ),
//     );
//   }
// }

