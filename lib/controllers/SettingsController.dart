import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:adhisree_foundation/models/GetSettingsModal.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();

  var contactInfo = Rxn<ContactInfoModel>();
  var isLoading = false.obs;

  Future<void> fetchContactInfo(String endpoint) async {
    try {
      isLoading.value = true;

      var response = await apiProvider.getRequest(endpoint);

      if (response != null && response is Map<String, dynamic>) {
        contactInfo.value = ContactInfoModel.fromJson(response);
      } else {
        print("Invalid response format");
      }

    } catch (e) {
      print("Error fetching contact info: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
