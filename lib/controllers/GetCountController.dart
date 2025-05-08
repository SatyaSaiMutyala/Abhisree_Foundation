import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:get/get.dart';

class NotificationCount {
  final String userId;
  final int unseenCount;

  NotificationCount({required this.userId, required this.unseenCount});

  factory NotificationCount.fromJson(Map<String, dynamic> json) {
    return NotificationCount(
      userId: json['user_id'],
      unseenCount: json['unseen_count'],
    );
  }
}

class Getcountcontroller extends GetxController {
  ApiProvider apiProvider = ApiProvider();

  var unseenCount = 0.obs;

  void fetchCount(String endpoint, String userId) async {
    try {
      final response = await apiProvider.getRequestWithId(endpoint, userId);
      final countModel = NotificationCount.fromJson(response);
      unseenCount.value = countModel.unseenCount;
    } catch (e) {
      print('Error fetching count: $e');
    }
  }
}
