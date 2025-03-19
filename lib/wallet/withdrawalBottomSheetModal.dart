import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';

class WithdrawalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DraggableScrollableSheet(
      initialChildSize: 0.5, 
      minChildSize: 0.4,
      maxChildSize: 0.8, 
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(width * 0.05),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: height * 0.02),

                // Select Account Field
                textFieldScreen(
                  'Select Account',
                  keyboardType: TextInputType.text,
                  hintText: 'XXXXXXXXXXX1233',
                ),
                SizedBox(height: height * 0.02),

                // Withdrawal Amount Field
                textFieldScreen(
                  'Withdrawal Amount',
                  keyboardType: TextInputType.number,
                  hintText: '₹100',
                ),
                SizedBox(height: height * 0.02),

                // Note Text
                Text(
                  'Note: GST 5% + GST 5% will be deducted from this amount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFFC7BDBD),
                  ),
                ),
                SizedBox(height: height * 0.04),

                // Withdraw Button
                CustomButton(text: 'WITHDRAWAL', onPressed: () => Navigator.pushNamed(context, AppRoutes.withdrawPaymentDetails)),

                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        );
      },
    );
  }
}
