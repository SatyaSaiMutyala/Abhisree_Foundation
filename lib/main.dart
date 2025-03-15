import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/bottomNav/controller/bottom_navbar_controller.dart';
import 'package:adhisree_foundation/homescreen/home_screen.dart';
import 'package:adhisree_foundation/loginScreen/messageScreen.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(BottomNavController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      home: Messagescreen(), 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        
      ),
    );
  }
}
