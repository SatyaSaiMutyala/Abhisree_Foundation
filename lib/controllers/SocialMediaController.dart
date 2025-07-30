import 'package:get/get.dart';

import '../api/apiProvider.dart';

class SocialLinksController extends GetxController {
  var isLoading = true.obs;
  var socialLinks = Rxn<SocialLinksModel>();
  final ApiProvider _apiProvider = ApiProvider();
  


  @override
  void onInit() {
    fetchSocialLinks();
    super.onInit();
  }

  Future<void> fetchSocialLinks() async {
    try {
      isLoading.value = true;
      final response = await _apiProvider.getRequest("social-links");

      if (response['success'] == true) {
        socialLinks.value = SocialLinksModel.fromJson(response);
      }
    } catch (e) {
      print("Error fetching social links: $e");
    } finally {
      isLoading.value = false;
    }
  }
}



class SocialLinksModel {
  final String instagram;
  final String facebook;
  final String youtube;
  final String website;

  SocialLinksModel({
    required this.instagram,
    required this.facebook,
    required this.youtube,
    required this.website,
  });

  factory SocialLinksModel.fromJson(Map<String, dynamic> json) {
    return SocialLinksModel(
      instagram: json['instagram'] ?? '',
      facebook: json['facebook'] ?? '',
      youtube: json['youtube'] ?? '',
      website: json['website'] ?? '',
    );
  }
}
