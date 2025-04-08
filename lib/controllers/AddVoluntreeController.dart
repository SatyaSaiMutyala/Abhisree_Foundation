import 'dart:io';
import 'package:adhisree_foundation/utils/constants.dart';
import 'package:adhisree_foundation/widgets/success_screens.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../utils/snackBar.dart';

class Addvolunteercontroller extends GetxController {
  var isLoading = false.obs;

  Future<void> AddVolunteer(String endpoint, Map<String, dynamic> userData) async {
    isLoading(true);

    try {
      var uri = Uri.parse("${baseUrl}/$endpoint"); 
      var request = http.MultipartRequest('POST', uri);

      // Attach text fields
      request.fields['user_id'] = userData['user_id'].toString();
      request.fields['first_name'] = userData['first_name'];
      request.fields['last_name'] = userData['last_name'];
      request.fields['email'] = userData['email'];
      request.fields['pan'] = userData['pan'];
      request.fields['aadhar_number'] = userData['aadhar_number'];
      request.fields['address'] = userData['address'];
      request.fields['gender'] = userData['gender'];

      // Attach photo
      if (userData['photo'] != null && userData['photo'] is File) {
        File photo = userData['photo'];
        request.files.add(await http.MultipartFile.fromPath(
          'photo',
          photo.path,
          filename: basename(photo.path),
        ));
      }

      // Attach Aadhar image
      if (userData['aadhar_photo'] != null && userData['aadhar_photo'] is File) {
        File aadhar = userData['aadhar_photo'];
        request.files.add(await http.MultipartFile.fromPath(
          'aadhar',
          aadhar.path,
          filename: basename(aadhar.path),
        ));
      }

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        showSuccessSnackbar("Volunteer form submitted successfully");
        Get.offAll(() => SuccessScreens());
      } else {
        showErrorSnackbar("Submission failed. Try again.");
      }
    } catch (e) {
      print("Exception: $e");
      showErrorSnackbar("An unexpected error occurred");
    } finally {
      isLoading(false);
    }
  }
}
