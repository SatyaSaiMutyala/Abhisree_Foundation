import 'package:adhisree_foundation/models/getuserModal.dart';
import 'package:get/get.dart';

import '../api/apiProvider.dart';

class UserProgressController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  var isLoading = false.obs;
  var userProgress = Rxn<UserDetailsModal>();
  var errorMessage = ''.obs;

  Future<void> fetchUserProgress(String userId) async {
    isLoading.value = true;
    final response = await _apiProvider.getRequestWithId('getProgress', userId);

    if (response != null && response['user'] != null) {
      userProgress.value = UserDetailsModal.fromJson(response);
      errorMessage.value = '';
    } else {
      errorMessage.value = response['error'] ?? 'Unknown error occurred';
    }

    isLoading.value = false;
  }
}
