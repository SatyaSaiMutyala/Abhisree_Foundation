import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:get/get.dart';

import '../utils/snackBar.dart';

class Walletrequestcontroller extends GetxController {
  final ApiProvider apiProvider = ApiProvider();
  var isLoading = false.obs;

  Future<void> submitWalletRequest(
      String endpoint, Map<String, dynamic> data) async {
    isLoading(true);
    try {
      var response = await apiProvider.postRequest(endpoint, data);

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
