// import 'package:flutter/material.dart';

// class Paymentdetailsscreen extends StatefulWidget {

//   @override
//   _PaymentDetails createState() => _PaymentDetails();
// }

// class _PaymentDetails extends State<Paymentdetailsscreen> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Successfully received"),
//         titleTextStyle: TextStyle(
//             fontSize: width * 0.045,
//             fontFamily: "Poppins",
//             color: Colors.black,
//             fontWeight: FontWeight.w500),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(
//             vertical: width * 0.08, horizontal: width * 0.07),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Payment Details',
//                   style: TextStyle(
//                     fontSize: width * 0.04,
//                     color: Color(0XFF000000),
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   '20-Sep 2024 | 10 : 30 AM',
//                   style: TextStyle(
//                     fontSize: width * 0.03,
//                     color: Color(0XFF2A2B2D),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: height * 0.01),
//             Divider(
//               color: Colors.grey,
//               thickness: 1,
//             ),
//             SizedBox(height: height * 0.02),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   'assets/images/Png/teams1.png',
//                   width: width * 0.2,
//                   height: height * 0.1,
//                 ),
//                 SizedBox(width: width * 0.03),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Prasanth Varma ',
//                         style: TextStyle(
//                           fontSize: width * 0.04,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Text(
//                         'XXXXXXXXX546',
//                         style: TextStyle(
//                           fontSize: width * 0.03,
//                           fontFamily: "Inter",
//                           fontWeight: FontWeight.w400,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: width * 0.03),
//                 Image.asset(
//                   'assets/images/Png/success.png',
//                   width: width * 0.05,
//                 ),
//                 SizedBox(width: width * 0.02),
//                 Text(
//                   '₹25,000',
//                   style: TextStyle(
//                       fontSize: width * 0.04, color: Color(0XFF039200)),
//                 )
//               ],
//             ),
//             SizedBox(height: height * 0.025),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Transaction ID',
//                     style: TextStyle(
//                       fontSize: width * 0.045,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: height * 0.006),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     '6827485353495673',
//                     style: TextStyle(
//                       fontSize: width * 0.03,
//                       fontFamily: "Inter",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: height * 0.02),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Inside Row
//                 Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start, // Ensures left alignment
//                   children: [
//                     Text(
//                       'Bank name',
//                       style: TextStyle(
//                         fontSize: width * 0.045,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(height: height * 0.006),
//                     Text(
//                       'State Bank of India',
//                       style: TextStyle(
//                         fontSize: width * 0.03,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),

//                 Row(
//                   children: [
//                     Image.asset(
//                       'assets/images/Png/sbi.png',
//                       width: width * 0.13,
//                     )
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(height: height * 0.02),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Debited to',
//                       style: TextStyle(
//                         fontSize: width * 0.045,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(height: height * 0.006),
//                     Text(
//                       'xxxxxxxxx34',
//                       style: TextStyle(
//                         fontSize: width * 0.03,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       '₹25,000',
//                       style: TextStyle(
//                         fontSize: width * 0.04,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/withdrawalDetailsModal.dart';

class Paymentdetailsscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WithdrawaldetailsModal detail =
        ModalRoute.of(context)!.settings.arguments as WithdrawaldetailsModal;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Format date and time
    DateTime dateTime = DateTime.parse(detail.createdAt);
    String formattedDate =
        DateFormat('dd-MMM-yyyy').format(dateTime); // e.g., 07-Apr-2025
    String formattedTime =
        DateFormat('hh:mm a').format(dateTime); // e.g., 12:59 PM
    String dateTimeDisplay = "$formattedDate | $formattedTime";

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
