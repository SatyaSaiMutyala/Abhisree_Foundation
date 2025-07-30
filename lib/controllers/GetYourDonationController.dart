import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:get/get.dart';

class DonationController extends GetxController {
  RxBool isLoading = true.obs;
  Rxn<DonationResponse> donationResponse = Rxn<DonationResponse>();
  final ApiProvider apiProvider = ApiProvider();

  Future<void> fetchDonations(String endpoint, String userId) async {
    try {
      isLoading.value = true;
      final res = await apiProvider.getRequestWithId(endpoint, userId);

      if (res['status'] == true) {
        donationResponse.value = DonationResponse.fromJson(res);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}



class Donation {
  final int id;
  final String price;
  final String createdAt;

  Donation({required this.id, required this.price, required this.createdAt});

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      id: json['id'],
      price: json['price'],
      createdAt: json['created_at'],
    );
  }
}

class DonationResponse {
  final bool status;
  final List<Donation> data;
  final String totalDonation;

  DonationResponse({
    required this.status,
    required this.data,
    required this.totalDonation,
  });

  factory DonationResponse.fromJson(Map<String, dynamic> json) {
    return DonationResponse(
      status: json['status'],
      data: (json['data'] as List).map((e) => Donation.fromJson(e)).toList(),
      totalDonation: json['total_donation'],
    );
  }
}
