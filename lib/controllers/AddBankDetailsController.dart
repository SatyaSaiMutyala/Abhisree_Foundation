import 'dart:convert';
import 'dart:io';
import 'package:adhisree_foundation/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../more_section/bank_details.dart';
import '../utils/snackBar.dart';

class Addbankdetailscontroller extends GetxController {
  var isLoading = false.obs;

  Future<void> submitBankData(String endpoint, Map<String, dynamic> userData) async {
    isLoading(true);

    try {
      var uri = Uri.parse("${baseUrl}/$endpoint"); 
      var request = http.MultipartRequest('POST', uri);

      // Add fields
      request.fields['user_id'] = userData['user_id'].toString();
      request.fields['bank_name'] = userData['bank_name'];
      request.fields['account_number'] = userData['account_number'];
      request.fields['ifsc'] = userData['ifsc'];
      request.fields['holder_name'] = userData['holder_name'];


      if (userData['image'] != null && userData['image'] is String) {
        final file = File(userData['image']);
        if (file.existsSync()) {
          request.files.add(await http.MultipartFile.fromPath(
            'image', 
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

       final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        final message = responseData['message'] ?? "Bank Details Added!!!!!!!!!" ;
        showSuccessSnackbar(message);
        Get.offAll(() => BankAccountsScreen());
      } else {
         String errorMessage = responseData['message'] ?? "Failed to Add Bank Details!";
      showErrorSnackbar(errorMessage);
      }
    } catch (e) {
      print('Exception: $e');
      showErrorSnackbar("An unexpected error occurred");
    } finally {
      isLoading(false);
    }
  }
}
