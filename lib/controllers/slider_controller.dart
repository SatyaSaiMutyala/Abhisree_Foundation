import 'package:get/get.dart';
import '../api/apiProvider.dart';
import '../models/banner_model.dart';

class SliderController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();
  var isLoading = true.obs;
  var bannerList = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  Future<void> fetchBanners() async {
    isLoading.value = true;
    final response = await apiProvider.getRequest('banners-get');

    if (response is List) {
      bannerList.value = response.map<BannerModel>((item) => BannerModel.fromJson(item)).toList();
      print('final data ******************${bannerList}');
    } else {
      print("Error: ${response['error']}");
    }
    
    isLoading.value = false;
  }
}
