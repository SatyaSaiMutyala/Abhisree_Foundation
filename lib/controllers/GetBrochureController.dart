import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:get/get.dart';

class GetBrochureController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  final isLoading = false.obs;
  final brochureModel = BrochureModel().obs;

  Future<void> fetchBrochure(String endpoint) async {
    try {
      isLoading.value = true;

      final response = await _apiProvider.getRequest(endpoint);

      if (response['success'] == true) {
        brochureModel.value = BrochureModel.fromJson(response);
      } else {
        print('Failed to fetch brochure');
      }
    } catch (e) {
      print('This is Error $e');
    } finally {
      isLoading.value = false;
    }
  }
}


class BrochureModel {
  bool? success;
  List<Brochure>? brochures;

  BrochureModel({this.success, this.brochures});

  BrochureModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['brochures'] != null) {
      brochures = <Brochure>[];
      json['brochures'].forEach((v) {
        brochures!.add(Brochure.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'brochures': brochures?.map((v) => v.toJson()).toList(),
    };
  }
}

class Brochure {
  String? title;
  String? url;

  Brochure({this.title, this.url});

  Brochure.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
    };
  }
}
