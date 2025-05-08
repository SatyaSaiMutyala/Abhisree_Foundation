import 'package:get/get.dart';
import '../api/apiProvider.dart';
import '../models/VolunteerModal.dart';

class Getemployeedetailscontroller extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  var isLoading = false.obs;
  var volunteerData = Rxn<VolunteerModal>();
  var errorMessage = ''.obs;

  Future<void> fetchEmployeeDetails(String userId) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await _apiProvider.getRequestWithId('employee/get', userId);
      print('RESPONSE ********${response}');

      if (response != null && response['employee'] != null && response['employee']['id'] != null) {
        volunteerData.value = VolunteerModal.fromJson(response['employee']);
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
