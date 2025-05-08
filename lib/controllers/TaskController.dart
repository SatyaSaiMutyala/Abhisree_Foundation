import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:adhisree_foundation/models/taskModel.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final ApiProvider apiProvider = ApiProvider();
  var loading = false.obs;
  var taskList = <TaskModel>[].obs;

  Future<void> fetchTasks(String endpoint) async {
    print('Fetching tasks...');
    try {
      loading.value = true;
      var response = await apiProvider.getRequest(endpoint);
      if (response != null && response is List) {
        taskList.value = response.map((e) => TaskModel.fromJson(e)).toList();
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      loading.value = false;
    }
  }
}
