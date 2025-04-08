// terms_conditions_screen.dart
import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Terms & Conditions")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Here goes your Terms & Conditions content...",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
