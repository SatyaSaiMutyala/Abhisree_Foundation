// // terms_conditions_screen.dart
// import 'package:flutter/material.dart';

// class TermsConditionsScreen extends StatelessWidget {
//   const TermsConditionsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Terms & Conditions")),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Text(
//           "Here goes your Terms & Conditions content...",
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }




// privacy_policy_screen.dart
import 'package:adhisree_foundation/controllers/TermsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class TermsConditionsScreen extends StatelessWidget {
  final controller = Get.put(Termscontroller());

  TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchPrivacyPolicy("terms_conditions");

    return Scaffold(
      appBar: AppBar(title: const Text("Terms & Conditions")),
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