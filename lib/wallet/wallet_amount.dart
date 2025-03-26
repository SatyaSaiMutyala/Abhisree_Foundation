import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/wallet/withdrawalBottomSheetModal.dart';
import 'package:flutter/material.dart';

class WalletAmountWidget extends StatelessWidget {
   final bool showTransactions;

  WalletAmountWidget({required this.showTransactions});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

      void _showWithdrawalPopup(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true, 
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => WithdrawalBottomSheet(), 
    );
  }

    return SizedBox(
      height: height * 0.22,
      child: Stack(
        children: [
          Positioned(
            left: width * 0.046,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.04),
              ),
              elevation: 2,
              shadowColor: Color(0x171A1F1F),
              color: Color(0xFFDAF6FA),
              child: Container(
                  width: width * 0.9,
                  height: height * 0.21,
                  padding: EdgeInsets.symmetric(
                    vertical: width * 0.05,
                  ),
                  alignment: Alignment.center,
                  child: Column(children: [
                    
                    SizedBox(height: height * 0.02 ),
                    Text(
                      "₹ 50,000.00",
                      style: TextStyle(
                        fontSize: width * 0.085,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.01,),
                    // if (!showTransactions)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: CustomButton(text: 'Withdrawal', onPressed:  () => _showWithdrawalPopup(context)),
                      ),
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
