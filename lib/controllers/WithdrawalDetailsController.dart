import 'package:get/get.dart';
import '../api/apiProvider.dart';
import '../models/withdrawalDetailsModal.dart';
import '../utils/snackBar.dart';

class WithdrawalDetailsController extends GetxController {
  final isLoading = false.obs;
  final WithdrawalDetails = <WithdrawaldetailsModal>[].obs;

  final ApiProvider _apiProvider = ApiProvider();

  Future<void> fetchWithdrawalData(String userId) async {
    try {
      isLoading.value = true;


      final response = await _apiProvider.getRequestWithId('getWithdrawrequestDetails', userId);

      if (response != null &&
          response is Map<String, dynamic> &&
          response.containsKey('details')) {
        final List<dynamic> dataList = response['details'];

        final detailsList = dataList
            .map((e) => WithdrawaldetailsModal.fromJson(e))
            .toSet()
            .toList(); 

        WithdrawalDetails.value = detailsList;
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
