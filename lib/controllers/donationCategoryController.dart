import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:get/get.dart';

import '../models/donationCategoryModel.dart';

class DonationCategoryController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();

  var categories = <DonationCategoryModel>[].obs;
  var isLoading = false.obs;

  // final ApiService apiService;

  // DonationCategoryController({required this.apiService});

  @override
  void onInit() {
    fetchDonationCategories();
    super.onInit();
  }

  void fetchDonationCategories() async {
    isLoading.value = true;
    final response = await apiProvider.getRequest('get-active-camp-category');

    if (response is List) {
      categories.value =
          response.map((item) => DonationCategoryModel.fromJson(item)).toList();
    }

    isLoading.value = false;
  }
}
