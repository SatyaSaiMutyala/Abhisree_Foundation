// import 'dart:convert';

// import 'package:adhisree_foundation/controllers/GetVolunteersDetailsController.dart';
// import 'package:adhisree_foundation/widgets/custom_cards.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DocumentsScreen extends StatefulWidget {
//   @override
//   _DocumentScreen createState() => _DocumentScreen();
// }

// class _DocumentScreen extends State<DocumentsScreen> {
//   final GetVolunteersDetailsController getVolunteersDetailsController =
//       Get.put(GetVolunteersDetailsController());

//   int? userId;
//   String? firstName;
//   String? lastName;
//   String? phoneNumber;
//   String? photoPath;

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
//         firstName = userData['first_name'];
//         lastName = userData['last_name'];
//         phoneNumber = userData['phone_number'];
//         photoPath = userData['photo_path'];
//       });
//       print('User DATA --------> ${userId}');
//     }
//     getVolunteersDetailsController.fetchVolunteerDetails('41'.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get device width & height
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(body: Obx(() {
//       if (getVolunteersDetailsController.isLoading.value) {
//         return Center(child: CircularProgressIndicator());
//       }

//       final data = getVolunteersDetailsController.volunteerData.value;

//       if (data == null) {
//         return Center(child: Text('No data found or an error occurred.'));
//       }

//       print('DATA ***************** ${data.idCardImage}');
//       print('DATA ***************** ${data.visitingCardImage}');

//       return SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(width * 0.052),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Back Button
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context); // Working back button
//                 },
//                 child: Container(
//                   width: width * 0.1,
//                   height: height * 0.05,
//                   decoration: BoxDecoration(
//                     color: Color(0XFFEFEEEE),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.arrow_back,
//                     size: width * 0.05,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),

//               SizedBox(height: height * 0.02), // Space after back button

//               // Scrollable Content
//               Expanded(
//                 child: SingleChildScrollView(
//                   physics: BouncingScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Title Text
//                       Text(
//                         'Abhisree Foundation Documents',
//                         style: TextStyle(
//                           fontSize: width * 0.05,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: "Poppins",
//                         ),
//                       ),
//                       SizedBox(height: width * 0.02),
//                       // Description
//                       Text(
//                         'Download the joining confirmation, offer letter, ID card, and visiting card required to volunteer at Abhisree Foundation.',
//                         style: TextStyle(
//                           fontSize: width * 0.03,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w400,
//                           color: Color(0XFF6F6B6B),
//                         ),
//                       ),
//                       SizedBox(height: height * 0.045),
//                       _buildDocumentCard('Joining Confirmation Letter', width),
//                       _buildDocumentCard('NDA', width),
//                       _buildDocumentCard('ID Card', width),
//                       _buildDocumentCard('Visiting Card', width),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }));
//   }

//   Widget _buildDocumentCard(String documentName, double width) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Document Name Row with Download Icon
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               width: width * 0.5,
//               height: width * 0.04,
//               child: Text(
//                 documentName.toUpperCase(),
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w500,
//                   fontSize: width * 0.034,
//                   height: 16 / 14,
//                   letterSpacing: 0,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             Image.asset("assets/icons/download_icon.png",
//                 color: Color(0XFF338D9B)),
//             IconButton(
//               icon: Icon(Icons.visibility_outlined,
//                   color: Color(0XFF338D9B), size: 20),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         SizedBox(height: width * 0.02),

//         // Custom card or spacing
//         // You can uncomment and use your custom card if needed:
//         // CustomCard(),

//         SizedBox(height: width * 0.04),
//       ],
//     );
//   }
// }









import 'dart:convert';
import 'dart:io';

import 'package:adhisree_foundation/controllers/GetVolunteersDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

class DocumentsScreen extends StatefulWidget {
  @override
  _DocumentScreen createState() => _DocumentScreen();
}

class _DocumentScreen extends State<DocumentsScreen> {
  final GetVolunteersDetailsController getVolunteersDetailsController =
      Get.put(GetVolunteersDetailsController());

  int? userId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? photoPath;

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
        firstName = userData['first_name'];
        lastName = userData['last_name'];
        phoneNumber = userData['phone_number'];
        photoPath = userData['photo_path'];
      });
      print('User DATA --------> $userId');
    }
    getVolunteersDetailsController.fetchVolunteerDetails(userId.toString());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        if (getVolunteersDetailsController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final data = getVolunteersDetailsController.volunteerData.value;

        if (data == null) {
          return Center(child: Text('You Don`t have a Documents yet!'));
        }

        // print('ID CARD ------------${data.Id}')

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(width * 0.052),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: width * 0.1,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: Color(0XFFEFEEEE),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      size: width * 0.05,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abhisree Foundation Documents',
                          style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: width * 0.02),
                        Text(
                          'Download the joining confirmation, offer letter, ID card, and visiting card required to volunteer at Abhisree Foundation.',
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF6F6B6B),
                          ),
                        ),
                        SizedBox(height: height * 0.045),
                        _buildDocumentCard('Joining Confirmation Letter', width, fileUrl: ''),
                        _buildDocumentCard('NDA', width, fileUrl: ''),
                        _buildDocumentCard('ID Card', width, fileUrl: data.idCardImage),
                        _buildDocumentCard('Visiting Card', width, fileUrl: data.visitingCardImage),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildDocumentCard(String documentName, double width,
      {required String? fileUrl}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.5,
              child: Text(
                documentName.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.034,
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (fileUrl != null) {
                  downloadFile(fileUrl, documentName);
                } else {
                  Get.snackbar("Error", "File not available");
                }
              },
              child: Image.asset("assets/icons/download_icon.png",
                  color: Color(0XFF338D9B)),
            ),
            IconButton(
              icon: Icon(Icons.visibility_outlined,
                  color: Color(0XFF338D9B), size: 20),
              onPressed: () {
                if (fileUrl != null) {
                  openFile(fileUrl);
                } else {
                  Get.snackbar("Error", "File not available");
                }
              },
            ),
          ],
        ),
        SizedBox(height: width * 0.04),
      ],
    );
  }

  Future<void> downloadFile(String url, String fileName) async {
    try {
      if (await Permission.storage.request().isGranted) {
        final dir = await getExternalStorageDirectory();
        final filePath =
            '${dir!.path}/$fileName-${DateTime.now().millisecondsSinceEpoch}.${url.split('.').last}';

        final response = await Dio().download(url, filePath);

        if (response.statusCode == 200) {
          Get.snackbar('Success', 'File downloaded');
          OpenFilex.open(filePath);
        } else {
          Get.snackbar('Error', 'Failed to download file');
        }
      } else {
        Get.snackbar('Permission', 'Storage permission denied');
      }
    } catch (e) {
      print('Download error: $e');
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  Future<void> openFile(String url) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/${url.split("/").last}';
      final file = File(filePath);

      if (!file.existsSync()) {
        await Dio().download(url, filePath);
      }

      await OpenFilex.open(filePath);
    } catch (e) {
      print('Open file error: $e');
      Get.snackbar('Error', 'Cannot open file');
    }
  }
}
