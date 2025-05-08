import 'package:get/get.dart';
import 'package:adhisree_foundation/api/apiProvider.dart';
import '../models/NotificationModel.dart';

class GetNotificationController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  var notifications = <NotificationModel>[].obs;
  var isLoading = false.obs;

 Future<void> fetchNotifications(String endpoint, String userId) async {
    try {
      isLoading.value = true;

      final response = await _apiProvider.getRequestWithId(endpoint, userId);

      if (response != null && response['notifications'] != null) {
        var notifList = response['notifications'] as List;
        notifications.value = notifList
            .map((json) => NotificationModel.fromJson(json))
            .toList();
      } else {
        notifications.clear(); // In case there's no data
      }
    } catch (e) {
      print("Fetch Notification Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
