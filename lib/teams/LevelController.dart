import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelController extends GetxController {
  RxInt currentLevel = 0.obs;

  // Future<void> checkAndShowLevelPopup(int newLevel, String role) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> shownLevels = prefs.getStringList('shownLevels') ?? [];

  //   // Check if level was already shown
  //   if (!shownLevels.contains(newLevel.toString())) {
  //     // Show popup
  //     _showCongratulationPopup(newLevel, role);

  //     // Add level to shown list and save
  //     shownLevels.add(newLevel.toString());
  //     await prefs.setStringList('shownLevels', shownLevels);
  //   }

  //   // Update current level in the controller
  //   currentLevel.value = newLevel;
  // }

  Future<void> checkAndShowLevelPopup(int newLevel, String role) async {
  if (newLevel == 1) {
    currentLevel.value = newLevel;
    return;
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> shownLevels = prefs.getStringList('shownLevels') ?? [];

  // Check if level was already shown
  if (!shownLevels.contains(newLevel.toString())) {
    // Show popup
    _showCongratulationPopup(newLevel, role);

    // Add level to shown list and save
    shownLevels.add(newLevel.toString());
    await prefs.setStringList('shownLevels', shownLevels);
  }

  // Update current level in the controller
  currentLevel.value = newLevel;
}



  void _showCongratulationPopup(int level, String role) {
    final context = Get.context!;
    final width = MediaQuery.of(context).size.width;

    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: width * 0.05),
      contentPadding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: width * 0.03,
      ),
      radius: 20,
      title: "🎉 Congratulations!",
      titleStyle: TextStyle(
        fontSize: width * 0.06,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
      content: Column(
        children: [
          Image.asset(
            'assets/images/Png/congratulations.png',
            height: width * 0.25,
          ),
          SizedBox(height: width * 0.04),
          Text(
            "You've been upgraded to",
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: width * 0.02),
          Text(
            "$role 🔥",
            style: TextStyle(
              fontSize: width * 0.07,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: width * 0.06),
          ElevatedButton.icon(
            onPressed: () => Get.back(),
            icon: Icon(Icons.celebration, size: width * 0.05),
            label: Text(
              "Awesome!",
              style: TextStyle(fontSize: width * 0.045),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.07,
                vertical: width * 0.035,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




  // void _showCongratulationPopup(int level) {
  //   Get.defaultDialog(
  //     title: "🎉 Congratulations!",
  //     content: Text("You've been upgraded to Level $level!"),
  //     confirm: ElevatedButton(
  //       onPressed: () => Get.back(),
  //       child: Text("OK"),
  //     ),
  //   );
  // }

//   void _showCongratulationPopup(int level, String role) {
//   Get.defaultDialog(
//     titlePadding: EdgeInsets.only(top: 20),
//     contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     radius: 20,
//     title: "🎉 Congratulations!",
//     titleStyle: TextStyle(
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//       color: Colors.deepPurple,
//     ),
//     content: Column(
//       children: [
//         Image.asset(
//           'assets/images/Png/congratulations.png',
//           height: 100,
//         ),
//         SizedBox(height: 16),
//         Text(
//           "You've been upgraded to",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             fontFamily: 'Poppins',
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           "$role 🔥",
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Colors.orange,
//             fontFamily: 'Poppins',
//           ),
//         ),
//         SizedBox(height: 20),
//         ElevatedButton.icon(
//           onPressed: () => Get.back(),
//           icon: Icon(Icons.celebration),
//           label: Text("Awesome!"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.deepPurple,
//             foregroundColor: Colors.white,
//             padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }