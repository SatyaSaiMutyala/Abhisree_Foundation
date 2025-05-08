import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:adhisree_foundation/utils/snackBar.dart';
import 'package:get/get.dart';

class DeleteBankDetailsController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();

  Future<void> DeleteBank(String endpoint, String id) async {
    try {
      final response = await apiProvider.deleteRequestWithId(endpoint, id);
      if (response['message'] != null) {
        showSuccessSnackbar(response['message']);
      } else if (response['error'] != null) {
        showErrorSnackbar(response['error']);
      }
    } catch (e) {
      showErrorSnackbar('Something went wrong: $e');
    }
  }
}
