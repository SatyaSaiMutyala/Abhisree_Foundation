import 'dart:convert';
import 'package:adhisree_foundation/controllers/GetBankDetailsController.dart';
import 'package:adhisree_foundation/controllers/WithdrawalDetailsController.dart';
import 'package:adhisree_foundation/controllers/walletRequestController.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/snackBar.dart';
import 'package:adhisree_foundation/widgets/text_feilds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../../models/BankDetailModel.dart';
import '../bottomNav/controller/bottom_navbar_controller.dart';

class WithdrawalBottomSheet extends StatefulWidget {
  @override
  _WithdrawalBottomSheetState createState() => _WithdrawalBottomSheetState();
}

class _WithdrawalBottomSheetState extends State<WithdrawalBottomSheet> {
  final BankDetailsController bankDetailsController =
      Get.put(BankDetailsController());

  final Walletrequestcontroller walletrequestcontroller =
      Get.put(Walletrequestcontroller());

  final WithdrawalDetailsController withdrawalDetailsController =
      Get.put(WithdrawalDetailsController());

  final TextEditingController _amountController = TextEditingController();

  int? userId;
  BankDetailModel? selectedBank;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userData = jsonDecode(userJson);
      setState(() {
        userId = userData['id'];
      });
      bankDetailsController.fetchBankDetails(userId.toString());
    }
  }

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

                // Select Account Dropdown
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Account',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Obx(() {
                  if (bankDetailsController.isLoading.value) {
                    // Shimmer placeholder during loading
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }

                  if (bankDetailsController.bankDetails.isEmpty) {
                    return Text("No bank accounts found.");
                  }

                  return DropdownButtonFormField<BankDetailModel>(
                    isExpanded: true,
                    value: selectedBank,
                    hint: Text("Choose your bank account"),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF4F4F4),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    items: bankDetailsController.bankDetails.map((bank) {
                      return DropdownMenuItem<BankDetailModel>(
                        value: bank,
                        child: Text("${bank.bankName} - ${bank.accountNumber}"),
                      );
                    }).toList(),
                    onChanged: (BankDetailModel? newBank) {
                      setState(() {
                        selectedBank = newBank;
                      });
                    },
                  );
                }),

                SizedBox(height: height * 0.02),

                // Withdrawal Amount Field
                textFieldScreen(
                  'Withdrawal Amount',
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  hintText: '₹100',
                ),
                SizedBox(height: height * 0.02),

                // Note
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
                // CustomButton(
                //   text: 'WITHDRAWAL',
                // onPressed: () async {
                //   if (selectedBank == null) {
                //     showErrorSnackbar("Please select a bank account");
                //     return;
                //   }
                //   if (_amountController.text.isEmpty) {
                //     showErrorSnackbar("Please enter amount");
                //     return;
                //   }
                //   print(
                //       'this is amount ------------>${_amountController.text}');
                //   print('this is id ------------>${selectedBank!.id}');
                //   final bankData = {
                //     'user_id': userId,
                //     'amount': _amountController.text,
                //     'bank_id': selectedBank!.id.toString(),
                //   };
                // await  walletrequestcontroller.submitWalletRequest(
                //       'storeWithdrawRequest', bankData);

                //  await withdrawalDetailsController
                //       .fetchWithdrawalData(userId.toString());

                //   Navigator.of(context).pop();
                //   Get.find<BottomNavController>().changePage(BnbItem.wallet);
                // },
                // )

                CustomButton(
                  text: 'WITHDRAWAL',
                  onPressed: () async {
                    if (selectedBank == null) {
                      showErrorSnackbar("Please select a bank account");
                      return;
                    }
                    if (_amountController.text.isEmpty) {
                      showErrorSnackbar("Please enter amount");
                      return;
                    }

                    DateTime now = DateTime.now();
                    int weekday = now.weekday; // 1 = Monday, ..., 7 = Sunday
                    int hour = now.hour;

                    bool isWeekday = weekday >= 1 && weekday <= 5;
                    bool isWithinTime = hour >= 10 && hour < 17;

                    if (isWeekday && isWithinTime) {
                      // Prepare the data
                      final bankData = {
                        'user_id': userId,
                        'amount': _amountController.text,
                        'bank_id': selectedBank!.id.toString(),
                      };

                      // Call API first
                      await walletrequestcontroller.submitWalletRequest(
                          'storeWithdrawRequest', bankData);
                      await withdrawalDetailsController
                          .fetchWithdrawalData(userId.toString());

                      // Show confirmation dialog
                      await showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.white,
                          title: Row(
                            children: [
                              Icon(Icons.check_circle_rounded,
                                  color: Colors.green, size: 28),
                              SizedBox(width: 10),
                              Text(
                                "Success",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          content: Text(
                            "Your withdrawal request has been submitted successfully.\n\nThe amount will be debited within 24 hours.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.black54,
                            ),
                          ),
                          actionsAlignment: MainAxisAlignment.end,
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF338D9B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              onPressed: () {
                                Navigator.pop(context); // close dialog
                                Navigator.of(context)
                                    .pop(); // close bottom sheet
                                Get.find<BottomNavController>().changePage(
                                    BnbItem.wallet); // go to wallet tab
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Not allowed time
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.white,
                          title: Row(
                            children: [
                              Icon(Icons.warning_amber_rounded,
                                  color: Colors.orange, size: 28),
                              SizedBox(width: 10),
                              Text(
                                "Notice",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          content: Text(
                            "Withdrawals are allowed only\nfrom *Monday to Friday*\nbetween *10 AM to 5 PM*.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.black54,
                            ),
                          ),
                          actionsAlignment: MainAxisAlignment.end,
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF338D9B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),

                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        );
      },
    );
  }
}
