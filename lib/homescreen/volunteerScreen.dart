
import 'package:adhisree_foundation/controllers/TaskController.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:adhisree_foundation/utils/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Volunteerscreen extends StatefulWidget {
  @override
  _VolunteerscreenState createState() => _VolunteerscreenState();
}

class _VolunteerscreenState extends State<Volunteerscreen> {
  final TaskController taskcontroller = Get.put(TaskController());

    @override
    void initState() {
      super.initState();
      taskcontroller.fetchTasks('getVolunteerTasks');
    }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(body: Obx(() {
      if (taskcontroller.loading.value) {
        return Center(child: CircularProgressIndicator());
      }
      var taskData = taskcontroller.taskList.value;
      var filteredTaskData =
          taskData.where((item) => item.role == 'volunteer').toList();
      
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 181, 233, 240),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Color.fromARGB(255, 181, 233, 240),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.05, left: width * 0.05),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFEFEEEE),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back,
                          color: Colors.black, size: width * 0.06),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Png/Users.png',
                      width: width * 0.2),
                  Text(
                    "Join as volunteer",
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Text(
                      "Get started with a free membership by completing the form and enjoy priority access to services.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: Center(
                      child: Text(
                        'Membership in the Abhisree Foundation gives you good opportunities.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.042,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                    ),
                    child: Column(
                      children: filteredTaskData
                          .map(
                            (item) => Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: width * 0.01),
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
                  ),
                  // SizedBox(height: height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          activeColor:
                              Color(0xFF338D9B), // Checkbox background color
                          checkColor: Colors.white, // Tick mark color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                4), // Optional: Adds slight rounding to checkbox
                          ),
                        ),
                        // SizedBox(width: width * 0.0),
                        Text(
                          'I agree with ',
                          style: TextStyle(
                            fontSize: width * 0.035,
                          ),
                        ),
                        Text(
                          'terms and conditions',
                          style: TextStyle(
                            fontSize: width * 0.035,
                            color: Color(0xFF1A73E8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        if (!isChecked) {
                          showErrorSnackbar(
                              'Please agree to the terms and conditions to continue.');
                        } else {
                          Navigator.pushNamed(
                              context, AppRoutes.volunteerMembership);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),),
          ],
        ),
      );
    }));
  }
}
