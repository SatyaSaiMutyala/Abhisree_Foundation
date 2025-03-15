import 'package:adhisree_foundation/loginScreen/loginWithNumberScreen.dart';
import 'package:adhisree_foundation/loginScreen/messageScreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String messageScreen = '/';
  static const String LoginWithNumber = '/login' ;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case messageScreen: 
      return MaterialPageRoute(builder: (_) => Messagescreen());

      case LoginWithNumber :
      return MaterialPageRoute(builder: (_) => Loginwithnumberscreen());

      default : 
      return MaterialPageRoute(builder: (_) =>Scaffold(
        body: Center(child:  Text('No routes defined for ${settings.name}'),),
      ));
    }
  }
}