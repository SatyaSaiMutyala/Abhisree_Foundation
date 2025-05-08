import 'package:get/get.dart';
import 'package:adhisree_foundation/api/apiProvider.dart';
import '../models/user_model.dart';

class GetRefDataController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();

  var user = Rxn<User>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchRefData(String endpoint, String userId) async {
    print('Yeah***************************');
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await apiProvider.getRequestWithId(endpoint, userId);
      
      if (response['success'] == true && response['user'] != null) {
        user.value = User.fromJson(response['user']);
      } else {
        errorMessage.value = 'Failed to fetch user data';
      }
    } catch (e) {
      print('This is Error : $e');
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
