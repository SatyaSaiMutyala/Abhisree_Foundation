import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:get/get.dart';

class UnseenNotificationController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();

  // Optional observable if you want to track API response or state
  var isLoading = false.obs;
  var responseMessage = ''.obs;

  Future<void> postUnseenNotification(String id) async {
    try {
      isLoading.value = true;

      final response = await apiProvider.postRequestWithId(id);
      
      // Optional: handle or show response
      if (response != null && response['error'] == null) {
        responseMessage.value = 'Notification updated successfully';
        print('Success: $response');
      } else {
        responseMessage.value = response['error'] ?? 'Unknown error';
        print('Failed: $response');
      }

    } catch (e) {
      print('This is an error: $e');
      responseMessage.value = 'Exception occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
