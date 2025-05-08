import 'dart:convert';

import 'package:adhisree_foundation/controllers/WalletController.dart';
import 'package:adhisree_foundation/controllers/WithdrawalDetailsController.dart';
import 'package:adhisree_foundation/models/walletModal.dart';
import 'package:adhisree_foundation/models/withdrawalDetailsModal.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:adhisree_foundation/wallet/wallet_amount.dart';
import 'package:adhisree_foundation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/NotificationCountController.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final Walletcontroller walletcontroller = Get.put(Walletcontroller());
  final WithdrawalDetailsController withdrawalDetailsController =
      Get.put(WithdrawalDetailsController());
  final Notificationcountcontroller notificationcountcontroller =
      Get.put(Notificationcountcontroller());

  Key _refreshKey = UniqueKey();

  bool showTransactions = true;
  int? userId;
  DateTime? _startDate;
  String? _startDateText;
  String dateTimeDisplay = '';

  DateTime? _endDate;
  String? _endDateText;
  String selectedType = 'Transaction';

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
    }
    walletcontroller.fetchWalletData(userId.toString());
    withdrawalDetailsController.fetchWithdrawalData(userId.toString());
    await notificationcountcontroller.fetchCount(userId.toString());
  }

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _refreshKey = UniqueKey();
    });
  }

  @override
  void dispose() {
    if (userId != null) {
      Future.delayed(Duration.zero, () async {
        await notificationcountcontroller.fetchCount(userId.toString());
      });
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        if (walletcontroller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => CustomAppBar(
                screenType: 'wallet',
                notificationCount:
                    notificationcountcontroller.unseenCount.value,
                startDate: _startDateText,
                endDate: _endDateText,
                onStartDateChanged: (pickedDate) {
                  setState(() {
                    _startDate = pickedDate;
                    _startDateText =
                        DateFormat('dd MMM yyyy').format(pickedDate);
                  });
                },
                onEndDateChanged: (pickedDate) {
                  setState(() {
                    _endDate = pickedDate;
                    _endDateText = DateFormat('dd MMM yyyy').format(pickedDate);
                  });
                },
                onClearDates: () {
                  setState(() {
                    _startDate = null;
                    _endDate = null;
                    _startDateText = null;
                    _endDateText = null;
                    selectedType = 'Transaction';
                  });
                },
                selectedType: selectedType,
                onTypeChanged: (value) {
                  setState(() {
                    selectedType = value;
                    showTransactions = value == 'Transaction';
                  });
                },
              ),
            ),

            SizedBox(height: height * 0.02),

            // Wallet Title
            Padding(
              padding: EdgeInsets.only(left: width * 0.06),
              child: Text(
                "Wallet",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.04,
                  color: Theme.of(context).shadowColor.withOpacity(0.8),
                ),
              ),
            ),
            SizedBox(height: height * 0.015),

            // Wallet Amount Widget
            WalletAmountWidget(
                showTransactions: showTransactions,
                amount: walletcontroller.walletAmount.value),

            // Transaction & Withdrawal History Toggle
            Container(
              width: width * 2,
              margin: EdgeInsets.only(top: width * 0.06, left: width * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showTransactions = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Transaction History",
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.04,
                          color: showTransactions
                              ? Colors.black
                              : Color(0xFFB8B5B5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showTransactions = false;
                      });
                    },
                    child: Container(
                      width: width * 0.5,
                      alignment: Alignment.center,
                      child: Text(
                        "Withdrawal History",
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.04,
                          color: showTransactions
                              ? Color(0xFFB8B5B5)
                              : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: width * 0.01),

            // Transaction List
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Obx(() {
                  final userData = walletcontroller.users;
                  final withdrawalData =
                      withdrawalDetailsController.WithdrawalDetails;

                  final filteredData = selectedType == 'Withdrawal'
                      ? userData
                      : userData.where((user) {
                          final createdAt = DateTime.parse(user.createdAt);
                          if (_startDate != null &&
                              createdAt.isBefore(_startDate!)) return false;
                          if (_endDate != null && createdAt.isAfter(_endDate!))
                            return false;
                          return true;
                        }).toList();

                  final filteredwithdrawData = selectedType == 'Transaction'
                      ? withdrawalData
                      : withdrawalData.where((user) {
                          final createdAt = DateTime.parse(user.createdAt);
                          if (_startDate != null &&
                              createdAt.isBefore(_startDate!)) return false;
                          if (_endDate != null && createdAt.isAfter(_endDate!))
                            return false;
                          return true;
                        }).toList();

                  return showTransactions
                      ? buildTransactionList(filteredData)
                      : buildWithdrawalList(filteredwithdrawData);
                }),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildTransactionList(List<WalletModal> userData) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if (userData.isEmpty) {
      return Center(
        child: Text(
          "No Transaction History",
          style: TextStyle(
            fontSize: width * 0.045,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      );
    }

    print('DATA *******${userData[0].firstName}');

    return RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.builder(
          key: _refreshKey,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: userData.length,
          itemBuilder: (context, index) {
            final user = userData[index];
            String formattedDate = user.updatedAt.split(" ").first;
            double amountValue = double.tryParse(
                  (user.transactionType == 'byadmin' &&
                          user.transcationAmount != null &&
                          user.transcationAmount!.isNotEmpty)
                      ? user.transcationAmount!
                      : (user.amount ?? 0).toString(),
                ) ??
                0;

            int displayAmount = amountValue.toInt();

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.refferedPaymentScreen,
                  arguments: {
                    'firstName': user.firstName,
                    'lastName': user.lastName,
                    'photoPath': user.photoPath,
                    'createdAt': formattedDate,
                    'amount': user.amount,
                    'transcationAmount': user.transcationAmount,
                    'transactionType': user.transactionType,
                  },
                );
              },
              child: Container(
                width: width * 0.4,
                margin: EdgeInsets.only(bottom: width * 0.02),
                padding: EdgeInsets.fromLTRB(
                  width * 0.02,
                  width * 0.03,
                  width * 0.04,
                  width * 0.03,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date & Time Bar
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: Text(
                        formattedDate,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6F6B6B),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),

                    // Name and Amount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: Text(
                              "${user.firstName} ${user.lastName}",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),

                        // Amount
                        Container(
                          padding: EdgeInsets.only(right: width * 0.02),
                          child: Row(
                            children: [
                              Icon(Icons.add,
                                  color: Color(0xFF039200), size: 16),
                              SizedBox(width: 2),
                              Text(
                                "₹${displayAmount}",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF039200),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget buildWithdrawalList(List<WithdrawaldetailsModal> withdrawDetails) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if (withdrawDetails.isEmpty) {
      return Center(
        child: Text(
          "No Withdrawal History",
          style: TextStyle(
            fontSize: width * 0.045,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      );
    }

    return RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.builder(
          key: _refreshKey,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: withdrawDetails.length,
          itemBuilder: (context, index) {
            final detail = withdrawDetails[index];

            // DateTime dateTime = DateTime.parse(detail.createdAt);
            // String formattedDate = DateFormat('dd-MMM-yyyy').format(dateTime);
            // String formattedTime = DateFormat('hh:mm a').format(dateTime);
            // String dateTimeDisplay = "$formattedDate | $formattedTime";

            try {
              String rawDate = detail.reqTime?.toString()?.trim() ?? "";

              // This is the exact format you're receiving: "2026-04-19 09:51:43"
              DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
              DateTime dateTime = inputFormat.parseStrict(rawDate);

              String formattedDate = DateFormat('dd-MMM-yyyy').format(dateTime);
              String formattedTime = DateFormat('hh:mm a').format(dateTime);
              dateTimeDisplay = "$formattedDate | $formattedTime";
            } catch (e) {
              print("Date parsing error: $e");
              dateTimeDisplay = "Invalid date";
            }

            String accountDisplay = detail.accountNumber.length > 4
                ? "xxxxxxx${detail.accountNumber.substring(detail.accountNumber.length - 4)}"
                : detail.accountNumber;

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.withdrawPaymentDetails,
                  arguments: detail,
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: width * 0.02),
                padding: EdgeInsets.fromLTRB(
                    width * 0.02, width * 0.03, width * 0.04, width * 0.03),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date & Time
                    Container(
                      width: width * 0.9,
                      height: 15,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateTimeDisplay,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6F6B6B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.006),

                    // Debited To + Amount
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Debited to",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                detail!.status == "Approved"
                                    ? Icons.check_circle
                                    : detail.status == "Rejected"
                                        ? Icons.cancel
                                        : Icons.hourglass_empty,
                                color: detail.status == "Approved"
                                    ? Color(0xFF039200)
                                    : detail.status == "Rejected"
                                        ? Colors.red
                                        : Colors.orange,
                                size: width * 0.05,
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                detail.status ?? '',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: detail.status == "Approved"
                                      ? Color(0xFF039200)
                                      : detail.status == "Rejected"
                                          ? Colors.red
                                          : Colors.orange,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    // Account Number
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: Text(
                        accountDisplay,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6F6B6B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}







// import 'dart:convert';

// import 'package:adhisree_foundation/controllers/WalletController.dart';
// import 'package:adhisree_foundation/controllers/WithdrawalDetailsController.dart';
// import 'package:adhisree_foundation/models/walletModal.dart';
// import 'package:adhisree_foundation/models/withdrawalDetailsModal.dart';
// import 'package:adhisree_foundation/utils/routes.dart';
// import 'package:adhisree_foundation/wallet/wallet_amount.dart';
// import 'package:adhisree_foundation/widgets/custom_appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class WalletScreen extends StatefulWidget {
//   @override
//   _WalletScreenState createState() => _WalletScreenState();
// }


// class _WalletScreenState extends State<WalletScreen> {
//   final Walletcontroller walletcontroller = Get.put(Walletcontroller());
//   final WithdrawalDetailsController withdrawalDetailsController =
//       Get.put(WithdrawalDetailsController());
//   Key _refreshKey = UniqueKey();

//   bool showTransactions = true;
//   int? userId;
//   String? _startDate;
//   String? _endDate;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserId();
//   }

//   Future<void> _loadUserId() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? userJson = prefs.getString('user');
//     if (userJson != null) {
//       Map<String, dynamic> userData = jsonDecode(userJson);
//       setState(() {
//         userId = userData['id'];
//       });
//     }
//     walletcontroller.fetchWalletData(userId.toString());
//     withdrawalDetailsController.fetchWithdrawalData(userId.toString());
//   }

//   Future<void> _refreshData() async {
//     await Future.delayed(Duration(seconds: 1));
//     setState(() {
//       _refreshKey = UniqueKey();
//     });
//   }

//   void _filterData(String startDate, String endDate) {
//     setState(() {
//       _startDate = startDate;
//       _endDate = endDate;

//       // Apply the filters to the controllers
//       walletcontroller.filterWalletData(startDate, endDate);
//       withdrawalDetailsController.filterWithdrawalData(startDate, endDate);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Obx(() {
//         if (walletcontroller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         final userData = walletcontroller.users.value;

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomAppBar(
//               screenType: 'wallet',
//               onStartDateChanged: (startDate) {
//                 _filterData(startDate, _endDate ?? '');
//               },
//               onEndDateChanged: (endDate) {
//                 _filterData(_startDate ?? '', endDate);
//               },
//             ),

//             SizedBox(height: height * 0.02),

//             // Wallet Title
//             Padding(
//               padding: EdgeInsets.only(left: width * 0.06),
//               child: Text(
//                 "Wallet",
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: width * 0.04,
//                   color: Theme.of(context).shadowColor.withOpacity(0.8),
//                 ),
//               ),
//             ),
//             SizedBox(height: height * 0.015),

//             // Wallet Amount Widget
//             WalletAmountWidget(
//                 showTransactions: showTransactions,
//                 amount: walletcontroller.walletAmount.value),

//             // Transaction & Withdrawal History Toggle
//             Container(
//               width: width * 2,
//               margin: EdgeInsets.only(top: width * 0.06, left: width * 0.08),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         showTransactions = true;
//                       });
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Transaction History",
//                         style: TextStyle(
//                           fontFamily: 'Outfit',
//                           fontWeight: FontWeight.w600,
//                           fontSize: width * 0.04,
//                           color: showTransactions
//                               ? Colors.black
//                               : Color(0xFFB8B5B5),
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         showTransactions = false;
//                       });
//                     },
//                     child: Container(
//                       width: width * 0.5,
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Withdrawal History",
//                         style: TextStyle(
//                           fontFamily: 'Outfit',
//                           fontWeight: FontWeight.w600,
//                           fontSize: width * 0.04,
//                           color: showTransactions
//                               ? Color(0xFFB8B5B5)
//                               : Colors.black,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: width * 0.01),

//             // Transaction List
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: width * 0.04),
//                 child: showTransactions
//                     ? Obx(() => buildTransactionList(walletcontroller.users))
//                     : Obx(() => buildWithdrawalList(
//                         withdrawalDetailsController.WithdrawalDetails)),
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }

//   Widget buildTransactionList(List<WalletModal> userData) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     // Filter based on the start and end date
//     List<WalletModal> filteredData = userData.where((user) {
//       DateTime transactionDate = DateTime.parse(user.createdAt);
//       DateTime? startDate = _startDate != null ? DateTime.parse(_startDate!) : null;
//       DateTime? endDate = _endDate != null ? DateTime.parse(_endDate!) : null;
//       bool isAfterStart = startDate == null || transactionDate.isAfter(startDate);
//       bool isBeforeEnd = endDate == null || transactionDate.isBefore(endDate);
//       return isAfterStart && isBeforeEnd;
//     }).toList();

//     if (filteredData.isEmpty) {
//       return Center(
//         child: Text(
//           "No Transaction History",
//           style: TextStyle(
//             fontSize: width * 0.045,
//             fontWeight: FontWeight.w500,
//             color: Colors.grey,
//           ),
//         ),
//       );
//     }

//     return RefreshIndicator(
//         onRefresh: _refreshData,
//         child: ListView.builder(
//           key: _refreshKey,
//           physics: AlwaysScrollableScrollPhysics(),
//           itemCount: filteredData.length,
//           itemBuilder: (context, index) {
//             final user = filteredData[index];
//             String formattedDate = user.createdAt.split(" ").first;

//             return GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   AppRoutes.refferedPaymentScreen,
//                   arguments: {
//                     'firstName': user.firstName,
//                     'lastName': user.lastName,
//                     'photoPath': user.photoPath,
//                     'createdAt': formattedDate,
//                   },
//                 );
//               },
//               child: Container(
//                 width: width * 0.4,
//                 margin: EdgeInsets.only(bottom: width * 0.02),
//                 padding: EdgeInsets.fromLTRB(
//                   width * 0.02,
//                   width * 0.03,
//                   width * 0.04,
//                   width * 0.03,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFF3F3F3),
//                   borderRadius: BorderRadius.circular(3),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Date & Time Bar
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: width * 0.02),
//                       child: Text(
//                         formattedDate,
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                           fontSize: width * 0.03,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF6F6B6B),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: height * 0.01),

//                     // Name and Amount
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: width * 0.02),
//                           child: Text(
//                             "${user.firstName} ${user.lastName}",
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontSize: width * 0.035,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Icon(Icons.add, color: Color(0xFF039200), size: 16),
//                             SizedBox(width: 2),
//                             Text(
//                               "₹120",
//                               style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontSize: width * 0.035,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFF039200),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ));
//   }

//   Widget buildWithdrawalList(List<WithdrawaldetailsModal> withdrawDetails) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     // Filter based on the start and end date
//     List<WithdrawaldetailsModal> filteredData = withdrawDetails.where((detail) {
//       DateTime withdrawalDate = DateTime.parse(detail.createdAt);
//       DateTime? startDate = _startDate != null ? DateTime.parse(_startDate!) : null;
//       DateTime? endDate = _endDate != null ? DateTime.parse(_endDate!) : null;
//       bool isAfterStart = startDate == null || withdrawalDate.isAfter(startDate);
//       bool isBeforeEnd = endDate == null || withdrawalDate.isBefore(endDate);
//       return isAfterStart && isBeforeEnd;
//     }).toList();

//     if (filteredData.isEmpty) {
//       return Center(
//         child: Text(
//           "No Withdrawal History",
//           style: TextStyle(
//             fontSize: width * 0.045,
//             fontWeight: FontWeight.w500,
//             color: Colors.grey,
//           ),
//         ),
//       );
//     }

//     return RefreshIndicator(
//         onRefresh: _refreshData,
//         child: ListView.builder(
//           key: _refreshKey,
//           physics: AlwaysScrollableScrollPhysics(),
//           itemCount: filteredData.length,
//           itemBuilder: (context, index) {
//             final detail = filteredData[index];

//             DateTime dateTime = DateTime.parse(detail.createdAt);
//             String formattedDate = DateFormat('dd-MMM-yyyy').format(dateTime);
//             String formattedTime = DateFormat('hh:mm a').format(dateTime);
//             String dateTimeDisplay = "$formattedDate | $formattedTime";

//             String accountDisplay = detail.accountNumber.length > 4
//                 ? "xxxxxxx${detail.accountNumber.substring(detail.accountNumber.length - 4)}"
//                 : detail.accountNumber;

//             return GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   AppRoutes.withdrawPaymentDetails,
//                   arguments: detail,
//                 );
//               },
//               child: Container(
//                 margin: EdgeInsets.only(bottom: width * 0.02),
//                 padding: EdgeInsets.fromLTRB(
//                     width * 0.02, width * 0.03, width * 0.04, width * 0.03),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFF3F3F3),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Date & Time
//                     Container(
//                       width: width * 0.9,
//                       height: 15,
//                       padding: EdgeInsets.symmetric(horizontal: width * 0.02),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             dateTimeDisplay,
//                             style: TextStyle(
//                               fontFamily: 'Inter',
//                               fontSize: width * 0.03,
//                               fontWeight: FontWeight.w400,
//                               color: Color(0xFF6F6B6B),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: height * 0.006),

//                     // Debited To + Amount
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: width * 0.02),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               "Debited to",
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontSize: width * 0.035,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 detail.status == "Approved"
//                                     ? Icons.check_circle
//                                     : detail.status == "Rejected"
//                                         ? Icons.cancel
//                                         : Icons.hourglass_empty,
//                                 color: detail.status == "Approved"
//                                     ? Color(0xFF039200)
//                                     : detail.status == "Rejected"
//                                         ? Colors.red
//                                         : Colors.orange,
//                                 size: width * 0.05,
//                               ),
//                               SizedBox(width: width * 0.02),
//                               Text(
//                                 detail.status ?? '',
//                                 style: TextStyle(
//                                   fontFamily: 'Outfit',
//                                   fontSize: width * 0.04,
//                                   fontWeight: FontWeight.w600,
//                                   color: detail.status == "Approved"
//                                       ? Color(0xFF039200)
//                                       : detail.status == "Rejected"
//                                           ? Colors.red
//                                           : Colors.orange,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),

//                     // Account Number
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: width * 0.02),
//                       child: Text(
//                         accountDisplay,
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                                                 fontSize: width * 0.035,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFFB8B5B5),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: height * 0.01),

//                 // Amount
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: width * 0.02),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "₹${detail.amount}",
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: width * 0.04,
//                           fontWeight: FontWeight.w600,
//                           color: detail.status == "Approved"
//                               ? Color(0xFF039200)
//                               : Colors.red,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     ));
//   }}
