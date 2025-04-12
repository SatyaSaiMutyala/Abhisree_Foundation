import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:adhisree_foundation/models/privacy_policy_model.dart';
import 'package:get/get.dart';

class Privacypolicycontroller extends GetxController {
  final ApiProvider apiProvider = ApiProvider();

  var policyInfo = Rxn<PrivacyPolicyModel>();
  var isLoading = false.obs;

  Future<void> fetchPrivacyPolicy(String endpoint) async {
    try {
      isLoading.value = true;

      var response = await apiProvider.getRequest(endpoint);
      print("Raw response: $response");
      print("Type: ${response.runtimeType}");

      // Since your response is a list
      if (response != null && response is List && response.isNotEmpty) {
        final data = response.first;
        policyInfo.value = PrivacyPolicyModel.fromJson(data);
      } else {
        print("Invalid response or empty list");
      }
    } catch (e) {
      print("Error fetching privacy policy: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
