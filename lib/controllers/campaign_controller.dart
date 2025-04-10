import 'package:adhisree_foundation/utils/snackBar.dart';
import 'package:get/get.dart';
import '../models/campaignDetails.dart';
import '../models/campaign_model.dart';
import '../api/apiProvider.dart';

class CampaignController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();
  
  var campaigns = <Campaign>[].obs;
  var selectedCampaign = Rxn<CampaignDetails>(); 
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchCampaigns();
    super.onInit();
  }

  void fetchCampaigns() async {
    isLoading.value = true;
    final response = await apiProvider.getRequest('active-campaign');

    if (response is List) {
      campaigns.value = response.map((e) => Campaign.fromJson(e)).toList();
    } else if (response is Map && response.containsKey('error')) {
      Get.snackbar("Error", response['error']);
    } else {
      Get.snackbar("Error", "Unexpected response format");
    }
    print('everything is one ==============================');
    isLoading.value = false;
  }

  Future<void> fetchCampaignwithPrice(int id) async {
    isLoading.value = true;
    final response = await apiProvider.getRequest('prices/$id');
    print('************1');
    if (response is Map && response.containsKey('campaign')) {
      print('****************in-1');
       selectedCampaign.value = CampaignDetails.fromJson(
      Map<String, dynamic>.from(response), 
      
    );
    } else if (response is Map && response.containsKey('error')) {
      // Get.snackbar("Error", response['error']);
      showErrorSnackbar(response['error']);
    } else {
      // Get.snackbar("Error", "Unexpected response format");
      showErrorSnackbar('Unexpected response format');
    }
    isLoading.value = false;
  }
}
