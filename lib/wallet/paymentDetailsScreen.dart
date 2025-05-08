
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/withdrawalDetailsModal.dart';

class Paymentdetailsscreen extends StatelessWidget {
String dateTimeDisplay = '';
  @override
  Widget build(BuildContext context) {
    final WithdrawaldetailsModal detail =
        ModalRoute.of(context)!.settings.arguments as WithdrawaldetailsModal;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Format date and time
    // DateTime dateTime = DateTime.parse(detail.createdAt);
    // String formattedDate =
    //     DateFormat('dd-MMM-yyyy').format(dateTime); // e.g., 07-Apr-2025
    // String formattedTime =
    //     DateFormat('hh:mm a').format(dateTime); // e.g., 12:59 PM
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

    print('Image *********************${detail.photoPath}');

    // // Fallback for image
    // String userImage = (detail.photoPath == null || detail.photoPath!.isEmpty)
    //     ? 'assets/images/Png/user.png'
    //     : detail.photoPath!;

    // print('Image *********************${userImage}');

    return Scaffold(
      appBar: AppBar(
        title: Text("Successfully received"),
        titleTextStyle: TextStyle(
          fontSize: width * 0.045,
          fontFamily: "Poppins",
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: width * 0.08,
          horizontal: width * 0.07,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
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
                  dateTimeDisplay,
                  style: TextStyle(
                    fontSize: width * 0.03,
                    color: Color(0XFF2A2B2D),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.01),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: height * 0.02),

            // User and amount info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child:
                      detail.photoPath != null && detail.photoPath!.isNotEmpty
                          ? Image.network(
                              detail.photoPath!,
                              width: width * 0.2,
                              height: width * 0.2,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/Png/user.png',
                                  width: width * 0.2,
                                  height: width * 0.2,
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              'assets/images/Png/user.png',
                              width: width * 0.2,
                              height: width * 0.2,
                              fit: BoxFit.cover,
                            ),
                ),
                SizedBox(width: width * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${detail.firstName} ${detail.lastName}',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'XXXXXXXXX${detail.accountNumber.substring(detail.accountNumber.length - 3)}',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                  detail.amount?.toString() ?? '0',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Color(0XFF039200),
                  ),
                )
              ],
            ),

            SizedBox(height: height * 0.025),

            // Transaction ID
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction ID',
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height * 0.006),
                Text(
                  detail?.status == "Approved"
                      ? detail?.transctionDetails ?? 'No Details'
                      : detail?.status == "Pending"
                          ? "Pending"
                          : "Rejected",
                  style: TextStyle(
                    fontSize: width * 0.03,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    color: detail?.status == "Approved"
                        ? Colors.black
                        : detail?.status == "Pending"
                            ? Colors.orange
                            : Colors.red,
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.02),

            // Bank Name and Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      detail.bankName,
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/Png/sbi.png', // You can make this dynamic too if needed
                  width: width * 0.13,
                ),
              ],
            ),

            SizedBox(height: height * 0.02),

            // Debited to section
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
                      'XXXXXXXXX${detail.accountNumber.substring(detail.accountNumber.length - 3)}',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  detail.amount.toString() ?? '0', 
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
