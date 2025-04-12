import 'package:adhisree_foundation/models/walletModal.dart';
import 'package:get/get.dart';
import '../api/apiProvider.dart';

class Walletcontroller extends GetxController {
  var isLoading = false.obs;
  var users = <WalletModal>[].obs;
  var walletAmount = 0.obs;
  final ApiProvider apiProvider = ApiProvider();

  Future<void> fetchWalletData(String userId) async {
    isLoading.value = true;

    final response = await apiProvider.getRequestWithId('getWalletDetails', userId);

    if (response != null) {
      final parsedData = UserResponseModel.fromJson(response);

      users.assignAll(parsedData.users);
      walletAmount.value = parsedData.walletAmount;

      print('this is wallet ---------------> ${walletAmount.value}');
    }

    isLoading.value = false;
  }
}
