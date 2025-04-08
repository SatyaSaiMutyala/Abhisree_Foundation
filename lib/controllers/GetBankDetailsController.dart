import 'package:get/get.dart';
import '../api/apiProvider.dart';
import '../models/BankDetailModel.dart';
import '../utils/snackBar.dart';

class BankDetailsController extends GetxController {
  var isLoading = false.obs;
  var bankDetails = <BankDetailModel>[].obs;

  final ApiProvider apiProvider = ApiProvider();

  Future<void> fetchBankDetails(String userId) async {
    try {
      isLoading.value = true;

      final response = await apiProvider.getRequestWithId('getBankDetails', userId);

      if (response is Map<String, dynamic> && response.containsKey('details')) {
        bankDetails.value = List<BankDetailModel>.from(
          response['details'].map((e) => BankDetailModel.fromJson(e)),
        );
      } else {
        showErrorSnackbar(response['error'] ?? 'Failed to fetch bank details');
      }
    } catch (e) {
      showErrorSnackbar('Something went wrong');
      print('Error fetching bank details: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
