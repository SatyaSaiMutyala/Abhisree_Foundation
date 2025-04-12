
// import 'package:get/get.dart';

// import '../api/apiProvider.dart';
// import '../utils/snackBar.dart';
// import '../utils/storageService.dart';

// class Profileupdatecontroller extends GetxController {
//   final ApiProvider apiProvider = ApiProvider();
//   final StorageService storageService = StorageService();
//   var isLoading = false.obs;

//   Future<void> submitUserData(String endpoint, Map<String, dynamic> userData) async {
//   isLoading(true);
//   try {
//     var response = await apiProvider.postRequest(endpoint, userData);

//     print('Response from server: $response');

        
//     // Check if response contains a message
//     if (response is Map && response.containsKey('message')) {
//       String successMessage = response['message'] ?? "Operation successful";
//       showSuccessSnackbar(successMessage); 
//     } else {
//       String errorMessage = response['error'] ?? 'Something went wrong';
//       showErrorSnackbar(errorMessage);
//     }
//   } catch (e) {
//     print('Exception: $e');
//     showErrorSnackbar("An unexpected error occurred");
//   } finally {
//     isLoading(false);
//   }
// }
// }

import 'dart:io';
import 'package:adhisree_foundation/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../utils/snackBar.dart';

class Profileupdatecontroller extends GetxController {
  var isLoading = false.obs;

  Future<void> submitUserData(String endpoint, Map<String, dynamic> userData) async {
    isLoading(true);

    try {
      var uri = Uri.parse("${baseUrl}/$endpoint"); 
      var request = http.MultipartRequest('POST', uri);

      // Add fields
      request.fields['user_id'] = userData['user_id'].toString();
      request.fields['first_name'] = userData['first_name'];
      request.fields['last_name'] = userData['last_name'];
      request.fields['email'] = userData['email'];
      request.fields['phone_number'] = userData['phone_number'];
      request.fields['gender'] = userData['gender'];

      // Attach profile image if available
      if (userData['photo_path'] != null && userData['photo_path'] is String) {
        final file = File(userData['photo_path']);
        if (file.existsSync()) {
          request.files.add(await http.MultipartFile.fromPath(
            'photo_path', 
            file.path,
            filename: basename(file.path),
          ));
        }
      }

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        showSuccessSnackbar("Profile updated successfully");
      } else {
        showErrorSnackbar("Failed to update profile");
      }
    } catch (e) {
      print('Exception: $e');
      showErrorSnackbar("An unexpected error occurred");
    } finally {
      isLoading(false);
    }
  }
}
