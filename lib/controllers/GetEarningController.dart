import 'package:get/get.dart';
import 'package:adhisree_foundation/api/apiProvider.dart';

class GetPlansController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  final isLoading = false.obs;
 final Rx<PlansModel> plansModel = PlansModel().obs;

  Future<void> fetchPlans(String endpoint) async {
    try {
      isLoading.value = true;
      final response = await _apiProvider.getRequest(endpoint);

      if (response['success'] == true) {
        plansModel.value = PlansModel.fromJson(response);
      } else {
        print('Failed to fetch plans');
      }
    } catch (e) {
      print('Error while fetching plans: $e');
    } finally {
      isLoading.value = false;
    }
  }
}



class PlansModel {
  bool? success;
  List<Plan>? plans;

  PlansModel({this.success, this.plans});

  PlansModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['plans'] != null) {
      plans = <Plan>[];
      json['plans'].forEach((v) {
        plans!.add(Plan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'plans': plans?.map((v) => v.toJson()).toList(),
    };
  }
}

class Plan {
  int? id;
  String? title;
  String? url;

  Plan({this.id, this.title, this.url});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
    };
  }
}
