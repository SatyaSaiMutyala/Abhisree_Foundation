// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void showSuccessSnackbar(String message) {
//   Get.snackbar(
//     "Success",
//     message,
//     backgroundColor: Colors.green,
//     colorText: Colors.white,
//     snackPosition: SnackPosition.BOTTOM, // Shows at the bottom
//     margin: EdgeInsets.all(10),
//     borderRadius: 8,
//     duration: Duration(seconds: 3),
//   );
// }

// void showErrorSnackbar(String message) {
//   Get.snackbar(
//     "Error",
//     message,
//     backgroundColor: Colors.red,
//     colorText: Colors.white,
//     snackPosition: SnackPosition.BOTTOM, // Shows at the bottom
//     margin: EdgeInsets.all(10),
//     borderRadius: 8,
//     duration: Duration(seconds: 3),
//   );
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessSnackbar(String message) {
  Get.rawSnackbar(
    message: message,
    backgroundColor: Colors.green,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(10),
    borderRadius: 8,
    duration: Duration(seconds: 3),
    isDismissible: true,
    snackStyle: SnackStyle.FLOATING,
    animationDuration: Duration(milliseconds: 300),
  );
}

void showErrorSnackbar(String message) {
  Get.rawSnackbar(
    message: message,
    backgroundColor: Colors.red,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(10),
    borderRadius: 8,
    duration: Duration(seconds: 3),
    isDismissible: true,
    snackStyle: SnackStyle.FLOATING,
    animationDuration: Duration(milliseconds: 300),
  );
}
