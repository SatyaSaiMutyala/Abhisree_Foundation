import 'dart:convert';

import 'package:adhisree_foundation/controllers/TaskController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/UserDetailsController.dart';

class Viewactivitesscreen extends StatefulWidget {
  @override
  _Viewactivescreen createState() => _Viewactivescreen();
}

class _Viewactivescreen extends State<Viewactivitesscreen> {
  TaskController taskcontroller = Get.put(TaskController());
  final UserProgressController userProgressController =
      Get.put(UserProgressController());
  int? userId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');

    if (userJson != null) {
      Map<String, dynamic> decodedUserData = jsonDecode(userJson);
      setState(() {
        userId = decodedUserData['id'];
      });
    }
    await userProgressController.fetchUserProgress(userId.toString());
    await taskcontroller.fetchTasks('getVolunteerTasks');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'volunteer tasks',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          var role = userProgressController.userProgress.value;
          print('ROLE MAN ------------>${role!.userType}');
          var taskData = taskcontroller.taskList.value;
          var filteredTaskData =
              taskData.where((item) => item.role == role.userType).toList();

          return Padding(
            padding: EdgeInsets.only(
              // top: width * 0.1,
              left: width * 0.04,
              right: width * 0.04,
            ),
            child: Column(
              children: filteredTaskData
                  .map(
                    (item) => Padding(
                      padding: EdgeInsets.symmetric(vertical: width * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/Png/Arrow.png',
                            width: width * 0.1,
                          ),
                          SizedBox(width: width * 0.02),
                          Expanded(
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: width * 0.035,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }));
  }
}
