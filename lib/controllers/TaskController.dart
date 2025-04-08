

import 'package:adhisree_foundation/api/apiProvider.dart';
import 'package:adhisree_foundation/models/taskModel.dart';
import 'package:get/get.dart';

class Taskcontroller extends GetxController {
  final ApiProvider apiProvider = ApiProvider();
  var loading = false.obs;
  var taskList = <Taskmodel>[].obs;

  Future<void> FetchTasks(endpoint, userId) async {
      try{
          loading.value = true;
           var response = await apiProvider.getRequestWithId(endpoint, userId);
           if(response != null && response is List) {
            taskList.value = response.map((e) => Taskmodel.fromJson(e)).toList();
           }
      }catch(e){
        print("Error Fetch Data : ${e}");
      } finally{
        loading.value = false;
      }
  }
}