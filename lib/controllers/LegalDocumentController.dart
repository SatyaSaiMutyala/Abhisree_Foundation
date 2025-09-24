
import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:get/get.dart';

class LegalDocumentController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  final isLoading = false.obs;
  final legalDocModel = LegalDocumentModel().obs;

  Future<void> fetchLegalDocuments(String endpoint) async {
    try {
      isLoading.value = true;

      final response = await _apiProvider.getRequest(endpoint);

      if (response['success'] == true) {
        legalDocModel.value = LegalDocumentModel.fromJson(response);
      } else {
        print('Failed to fetch legal documents');
      }
    } catch (e) {
      print('Error while fetching legal documents: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class LegalDocumentModel {
  bool? success;
  List<LegalDocument>? documents;

  LegalDocumentModel({this.success, this.documents});

  LegalDocumentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['documents'] != null) {
      documents = <LegalDocument>[];
      json['documents'].forEach((v) {
        documents!.add(LegalDocument.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'documents': documents?.map((v) => v.toJson()).toList(),
    };
  }
}

class LegalDocument {
  int? id;
  String? url;
  String? name;

  LegalDocument({this.id, this.url, this.name});

  LegalDocument.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'name' : name,
    };
  }
}
