import 'dart:convert';

import 'package:adhisree_foundation/homescreen/MainScreen.dart';
import 'package:adhisree_foundation/utils/snackBar.dart';
import 'package:get/get.dart';
import '../api/apiProvider.dart';
import '../bottomNav/bottom_nav_bar.dart';
import '../utils/storageService.dart';

class UserController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();
  final StorageService storageService = StorageService();
  var isLoading = false.obs;

  // Future<void> submitUserDataViaRefId(
  //     String endpoint, Map<String, dynamic> userData) async {
  //   isLoading(true);
  //   try {
  //     var response = await apiProvider.postRequest(endpoint, userData);

  //     print('Response from server: ${response}');

  //     // Ensure response is a Map and has statusCode 200
  //     if (response is Map && response['statusCode'] == 200) {
  //       // Print user details
  //       print('User Data Stored: ${response['user']}');

  //       // Store token and user data if available
  //       if (response.containsKey('token') && response.containsKey('user')) {
  //         await storageService.saveUserData(
  //             response['token'], response['user']);
  //       }

  //       Get.snackbar("Success", "User data submitted successfully!");
  //       // showSuccessSnackbar();
  //       Get.offAll(() => Mainscreen());
  //     } else {
  //       String errorMessage =
  //           response['error'] ?? 'Registration failed. Please try again.';
  //       print('Error: $errorMessage');
  //       Get.snackbar("Error", errorMessage);
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //     Get.snackbar("Error", "An unexpected error occurred");
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<void> submitUserDataViaRefId(
      String endpoint, Map<String, dynamic> userData) async {
    isLoading(true);
    try {
      var response = await apiProvider.postRequest(endpoint, userData);

      print('Response from server: $response');

      if (response is Map) {
        if (response.containsKey('user')) {
          String successMessage = response['message'] ?? "Operation successful";
          await storageService.saveUserData(
            response['user']['token'],
            response['user'],
            response['user']['user_type'],
          );
          showSuccessSnackbar(successMessage);
          Get.offAll(() => Mainscreen());
        } else {
          try {
            final errorBody = jsonDecode(response['message']);
            String errorMessage =
                errorBody['message'] ?? "Something went wrong";
            print('ERROR RESPONSE ------> $response');
            showErrorSnackbar(errorMessage);
            print('ERROR MESSAGE ------> $errorMessage');
          } catch (e) {
            // Fallback if decoding fails
            print('Failed to decode error message: $e');
            showErrorSnackbar("Something went wrong");
          }
        }
      } else {
        showErrorSnackbar("Invalid response format from server");
      }
    } catch (e) {
      print('Exception: $e');
      showErrorSnackbar("An unexpected error occurred");
    } finally {
      isLoading(false);
    }
  }

  Future<void> submitUserData(
      String endpoint, Map<String, dynamic> userData) async {
    isLoading(true);
    try {
      var response = await apiProvider.postRequest(endpoint, userData);

      print('Response from server: $response');

      // Check if response contains a message
      if (response is Map && response.containsKey('message')) {
        String successMessage = response['message'] ?? "Operation successful";
        showSuccessSnackbar(successMessage);
      } else {
        String errorMessage = response['error'] ?? 'Something went wrong';
        showErrorSnackbar(errorMessage);
      }
    } catch (e) {
      print('Exception: $e');
      showErrorSnackbar("An unexpected error occurred");
    } finally {
      isLoading(false);
    }
  }

  Future<void> verifyOtp(String phone, String otp) async {
    isLoading(true);
    try {
      var response = await apiProvider
          .postRequest('verify-otp', {'phone_number': phone, 'otp': otp});

      print('OTP Verification Response: $response');

      if (response is Map && response.containsKey('message')) {
        String successMessage = response['message'] ?? "OTP Verified!";
        await storageService.saveUserData(response['user']['token'],
            response['user'], response['user']['user_type']);

        showSuccessSnackbar(successMessage);
        print('this is role -------------->${response['user']['user_type']}');
        if (response['user']['user_type'] == 'volunteer' ||
            response['user']['user_type'] == 'employee') {
          Get.offAll(() => BottomNavScreen(initialPageIndex: 0));
        } else {
          Get.offAll(() => Mainscreen());
        }
      } else {
        String errorMessage = response['error'] ?? 'OTP verification failed!';
        Get.snackbar("Error", errorMessage);
        showErrorSnackbar(errorMessage);
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading(false);
    }
  }
}
