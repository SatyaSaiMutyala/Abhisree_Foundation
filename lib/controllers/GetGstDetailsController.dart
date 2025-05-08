import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:get/get.dart';

class GetgstdetailsController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();

  // Variables to store values as integers
  RxInt gst = 0.obs;
  RxInt platformFee = 0.obs;
  RxInt employeePayment = 0.obs;
  RxInt volunteerPay = 0.obs;

  Future<void> fetchGstDetails(String endpoint) async {
    print('**********************');
    try {
      final response = await apiProvider.getRequest(endpoint);
      print('try block************');
      print('Response ----------->${response['status']}');
      if (response['status'] == 'success') {
        for (var item in response['data']) {
          print('Checking ----->${item['key']}');
          switch (item['key']) {
            case 'gst':
              gst.value = int.parse(item['value']);
              break;
            case 'platform_fee':
              platformFee.value = int.parse(item['value']);
              break;
            case 'employee_payment':
              employeePayment.value = int.parse(item['value']);
              break;
            case 'volunteer_pay':
              volunteerPay.value = int.parse(item['value']);
              break;
          }
        }
      }
    } catch (e) {
      print('Error fetching GST details: $e');
    }
  }
}
