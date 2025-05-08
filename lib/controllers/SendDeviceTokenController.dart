import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:get/get.dart';

class SendDeviceTokenController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();

  Future<void> sendFcmToken(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await apiProvider.postRequest(endpoint, data);
      if (response['status'] == true) {
        print("FCM DEVICE TOKEN STORED *****");
      }
    } catch (e) {
      print("ERROR OCCURED *** $e");
    }
  }
}
