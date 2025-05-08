import 'package:adhisree_foundation/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/storageService.dart';

class ApiProvider {
  // final String baseUrl = 'https://royalblue-shark-559765.hostingersite.com/public/api';
  final StorageService storageService = StorageService();

  Future<dynamic> getRequest(String endpoint) async {
    try {
      String? token = await storageService.getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Authorization': token != null ? 'Bearer $token' : '',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          'error': 'Failed to load data',
          'statusCode': response.statusCode
        };
      }
    } catch (e) {
      return {'error': 'Network error: $e'};
    }
  }

  Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      String? token = await storageService.getToken();
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token != null ? 'Bearer $token' : '',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('this is response data ****************${response.body}');
        return jsonDecode(response.body);
      } else {
        return {
          'error': 'Failed to post data',
          'statusCode': response.statusCode
        };
      }
    } catch (e) {
      return {'error': 'Network error: $e'};
    }
  }

  Future<dynamic> getRequestWithId(String endpoint, String userId) async {
    try {
      String? token = await storageService.getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint/$userId'),
        headers: {
          'Authorization': token != null ? 'Bearer $token' : '',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          'error': 'Failed to load data',
          'statusCode': response.statusCode
        };
      }
    } catch (e) {
      return {'error': 'Network error: $e'};
    }
  }

  Future<dynamic> deleteRequestWithId(String endpoint, String id) async {
    try {
      String? token = await storageService.getToken();
      final response = await http.delete(
        Uri.parse('$baseUrl/$endpoint/$id'),
        headers: {
          'Authorization': token != null ? 'Bearer $token' : '',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          'error': 'Failed to delete data',
          'statusCode': response.statusCode,
          'body': response.body
        };
      }
    } catch (e) {
      return {'error': 'Network error: $e'};
    }
  }

   Future<dynamic> postRequestWithId(String id) async {
  try {
    String? token = await storageService.getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/unseen-to-seen-update?id=$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token != null ? 'Bearer $token' : '',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('This is response data ****************${response.body}');
      return jsonDecode(response.body);
    } else {
      return {
        'error': 'Failed to post data',
        'statusCode': response.statusCode
      };
    }
  } catch (e) {
    return {'error': 'Network error: $e'};
  }
}


}
