import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:get/get.dart';

class Notificationcountcontroller extends GetxController {
  ApiProvider api = ApiProvider();

  var unseenCount = 0.obs;
  var isLoading = false.obs;

 Future<void> fetchCount(String userId) async {
    try {
      isLoading.value = true;
      final response = await api.getRequestWithId('unseen-count/get', userId);
      unseenCount.value = response['unseen_count'] ?? 0;
    } catch (e) {
      print('ERROR OCCURRED: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
