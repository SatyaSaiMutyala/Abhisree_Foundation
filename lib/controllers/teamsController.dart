import 'package:get/get.dart';

import '../api/apiProvider.dart';
import '../models/referralModel.dart';

class ReferralController extends GetxController {
  var isLoading = false.obs;
  var referralData = Rxn<ReferralResponse>();
  final ApiProvider apiProvider = ApiProvider();

  Future<void> fetchReferralData(String userId) async {
    isLoading.value = true;
    final response = await apiProvider.getRequestWithId('teams', userId);
    if (response is Map<String, dynamic> && response.containsKey('user')) {
      referralData.value = ReferralResponse.fromJson(response);
    } else {
      Get.snackbar("Error", response['error'] ?? 'Unknown error');
    }
    isLoading.value = false;
  }
}
