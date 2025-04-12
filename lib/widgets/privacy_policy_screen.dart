// // privacy_policy_screen.dart
// import 'package:flutter/material.dart';

// class PrivacyPolicyScreen extends StatelessWidget {
//   const PrivacyPolicyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Privacy Policy")),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Text(
//           "Here goes your Privacy Policy content...",
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }





// privacy_policy_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../controllers/privacypolicycontroller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final controller = Get.put(Privacypolicycontroller());

  PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchPrivacyPolicy("privacy-policies");

    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.policyInfo.value == null) {
          return const Center(child: Text("No data available"));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Html(
            data: controller.policyInfo.value!.privacyPolicies,
          ),
        );
      }),
    );
  }
}
