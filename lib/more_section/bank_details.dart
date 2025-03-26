import 'package:adhisree_foundation/more_section/add_new_account.dart';
import 'package:adhisree_foundation/more_section/bank_accounts.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BankAccountsScreen extends StatelessWidget {
  final List<String> bankAccounts =
      ["State Bank of India", "HDFC Bank"]; // Empty list means no accounts available

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: height * 0.1, // Increase the height of the AppBar
        title: Text(
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
        leading: Padding(
          padding: EdgeInsets.only(
              left: width * 0.038,
              top: 0), // Adjust top and left padding for the icon
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: bankAccounts.isEmpty
                ? _buildNoBankAccountView(context)
                : _buildBankListView(context),
          ),

          // Positioned Bank Details Text
          // Positioned(
          //   top: height * 0.07,
          //   left: width * 0.35, // Centered dynamically
          //   child: Container(
          //     width: width * 0.3,
          //     height: height * 0.04,
          //     alignment: Alignment.center,
          //     child: Text(
          //       "Bank Details",
          //       style: TextStyle(
          //         fontFamily: "Inter",
          //         fontWeight: FontWeight.w600,
          //         fontSize: Dimensions.fontSizeExtraLarge,
          //         height: 33 / 16, // Line-height equivalent
          //         letterSpacing: 0,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),

          // Positioned Back Button
          //  Positioned(
          //     top: height * 0.065,
          //     left: width * 0.05,
          //     child: GestureDetector(
          //       onTap: () {
          //         Navigator.pop(context);
          //       },
          //       child: Container(
          //         width: width * 0.1,
          //         height: height * 0.05,
          //         padding: EdgeInsets.fromLTRB(8, 7, 8, 7), // Padding as required
          //         decoration: BoxDecoration(
          //           color:
          //               Color(0XFFEFEEEE), // Background color (Change if needed)
          //           shape: BoxShape.circle, // Circular button
          //           // border: Border.all(color: Color(0XFF338D9B), width: 2), // Border
          //         ),
          //         child: Icon(
          //           Icons.arrow_back, // Back icon
          //           size: width * 0.05, // Adjust size inside container
          //           color: Colors.black, // Icon color
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }

  Widget _buildNoBankAccountView(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewAccountScreen()),
              );
            },
            child: Container(
              width: width * 0.2,
              height: height * 0.09,
              decoration: BoxDecoration(
                color: Color(0xFFDAF6FA),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: width * 0.5,
                  height: height * 0.03,
                  child: Icon(Icons.add,
                      size: width * 0.07, color: Color(0xFF338D9B)),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.015),
          Text(
            "Add New Account",
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: height * 0.008),
          Text(
            "Add your bank details for your withdrawals",
            style: TextStyle(
                fontSize: width * 0.033,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
                color: Color(0XFF6F6B6B)),
          ),
        ],
      ),
    );
  }

  Widget _buildBankListView(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: height * 0.02), // Now this will work properly
        Expanded(
          // Ensures ListView works inside Column
          child: ListView.builder(
            itemCount: bankAccounts.length,
            itemBuilder: (context, index) => _buildBankAccountCard(
                context, bankAccounts[index], width, height),
          ),
        ),
      ],
    );
  }

  Widget _buildBankAccountCard(
      BuildContext context, String bankName, double width, double height) {
    return Column(
      children: [
        GestureDetector(
          // Makes the card tappable
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BankDetailsScreen(
                    bankName: bankName), // Pass data if needed
              ),
            );
          },
          child: Container(
            width: width * 0.9, // Fixed width
            height: height * 0.078, // Fixed height
            padding: EdgeInsets.all(width * 0.0125), // Inner padding
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(
                  Dimensions.radiusDefault), // Rounded corners
              border: Border.all(
                  color: Color(0xFFE3DFDF), width: 1), // Border styling
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05), // Light shadow
                  spreadRadius: 1,
                  blurRadius: Dimensions.radiusSmall,
                  offset: Offset(0, 1), // Shadow direction
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/sbi_icon.png",
                        width: width * 0.1, height: height * 0.05),
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
                        Text(
                          "Primary",
                          style: TextStyle(
                              fontSize: width * 0.03, color: Color(0XFF039200)),
                        ),
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
        SizedBox(height: height * 0.03), // Space between cards
      ],
    );
  }
}
