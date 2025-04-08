
// import 'package:adhisree_foundation/bottomNav/controller/bottom_navbar_controller.dart';
// import 'package:adhisree_foundation/loginScreen/messageScreen.dart';
// import 'package:adhisree_foundation/utils/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   Get.put(BottomNavController());
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: AppRoutes.generateRoute,
//       theme: ThemeData(
//         fontFamily: 'poppins',
//       ),
//       home: Messagescreen(), 
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(
        
//       ),
//       body: Center(
        
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/bottomNav/controller/bottom_navbar_controller.dart';
import 'package:adhisree_foundation/loginScreen/messageScreen.dart';
import 'package:adhisree_foundation/utils/routes.dart';

import 'homescreen/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures plugins are initialized
  Get.put(BottomNavController());

  // Retrieve token from local storage
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'poppins'),
      home: Splashscreen(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}


