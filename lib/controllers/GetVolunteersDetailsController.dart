import 'package:get/get.dart';
import '../api/apiProvider.dart';
import '../models/VolunteerModal.dart';

class GetVolunteersDetailsController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  var isLoading = false.obs;
  var volunteerData = Rxn<VolunteerModal>();
  var errorMessage = ''.obs;

  Future<void> fetchVolunteerDetails(String userId) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await _apiProvider.getRequestWithId('volunteer', userId);
      print('RESPONSE ********${response}');

      if (response != null && response['volunteer'] != null && response['volunteer']['id'] != null) {
        volunteerData.value = VolunteerModal.fromJson(response['volunteer']);
        print('Inner RESPONSE ******** ${volunteerData.value}');
      } else {
        errorMessage.value = response?['error'] ?? 'Unknown error occurred';
      }
    } catch (e) {
      errorMessage.value = 'Exception: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
