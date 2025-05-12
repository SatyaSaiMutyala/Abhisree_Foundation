
import 'package:get/get.dart';
import '../api/apiProvider.dart';
import '../utils/snackBar.dart';
import '../utils/storageService.dart';

class Minimumamountcontroller extends GetxController {
  final ApiProvider apiProvider = ApiProvider();
  final StorageService storageService = StorageService();
  var isLoading = false.obs;

  Future<void> VolunteerAmount(String endpoint, Map<String, dynamic> userData) async {
    isLoading(true);
    try {
      var response = await apiProvider.postRequest(endpoint, userData);

      print('Response from server: $response');

      if (response is Map<String, dynamic>) {
        if (response.containsKey('message')) {
          showSuccessSnackbar(response['message']);
          // Get.offAll(() => SuccessScreen());
        } else if (response.containsKey('error')) {
          showErrorSnackbar(response['error']);
        } else {
          showErrorSnackbar('Unexpected server response');
        }
      } else {
        showErrorSnackbar('Invalid response format');
      }
    } catch (e) {
      print('Exception: $e');
      showErrorSnackbar("An unexpected error occurred");
    } finally {
      isLoading(false);
    }
  }
}


// import 'dart:convert';
// import 'package:get/get.dart';
// import '../api/apiProvider.dart';
// import '../utils/snackBar.dart';
// import '../utils/storageService.dart';

// class Minimumamountcontroller extends GetxController {
//   final ApiProvider apiProvider = ApiProvider();
//   final StorageService storageService = StorageService();
//   var isLoading = false.obs;

//   Future<void> VolunteerAmount(String endpoint, Map<String, dynamic> userData) async {
//     isLoading(true);
//     try {
//       var response = await apiProvider.postRequest(endpoint, userData);

//       print('Response from server: $response');

//       if (response is Map<String, dynamic>) {
//         if (response.containsKey('message')) {
//           showSuccessSnackbar(response['message']);
//           // Get.offAll(() => SuccessScreen());
//         } else if (response.containsKey('error')) {
//           showErrorSnackbar(response['error']);
//         } else {
//           // Handle other cases like validation errors
//           String errorMessages = response.entries.map((e) {
//             if (e.value is List) {
//               return "${e.value.join(', ')}";
//             }
//             return "${e.value}";
//           }).join('\n');

//           showErrorSnackbar(errorMessages.isNotEmpty ? errorMessages : 'Unexpected server response');
//         }
//       } else {
//         showErrorSnackbar('Invalid response format');
//       }
//     } catch (e) {
//       print('Exception: $e');
//       showErrorSnackbar("An unexpected error occurred");
//     } finally {
//       isLoading(false);
//     }
//   }
// }
