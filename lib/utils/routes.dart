import 'package:adhisree_foundation/teams/viewActivitesScreen.dart';
import 'package:adhisree_foundation/wallet/paymentDetailsScreen.dart';
import 'package:adhisree_foundation/wallet/refferedPaymentScreen.dart';
import 'package:flutter/material.dart';

import 'package:adhisree_foundation/homescreen/MainScreen.dart';
import 'package:adhisree_foundation/homescreen/volunteerScreen.dart';
import 'package:adhisree_foundation/loginScreen/OtpScreen.dart';
import 'package:adhisree_foundation/loginScreen/loginWithNumberScreen.dart';
import 'package:adhisree_foundation/loginScreen/messageScreen.dart';
import 'package:adhisree_foundation/loginScreen/referralCodeScreen.dart';

class AppRoutes {
  static const String messageScreen = '/';
  static const String LoginWithNumber = '/login' ;
  static const String OtpScreen = '/otp';
  static const String referralCode = '/referral';
  static const String mainScreen = '/main';
  static const String volunteerScreen = '/volunteer';
  static const String withdrawPaymentDetails = '/withdrawPaymentDetails';
  static const String refferedPaymentScreen = '/refferedPaymentScreen';
  static const String viewActivityScreen = '/viewActivityScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case messageScreen: 
      return MaterialPageRoute(builder: (_) => Messagescreen());

      case LoginWithNumber :
      return MaterialPageRoute(builder: (_) => Loginwithnumberscreen());

      case OtpScreen :
      return MaterialPageRoute(builder: (_) => Otpscreen());

      case referralCode :
      return MaterialPageRoute(builder: (_) => Referralcodescreen());

      case mainScreen : 
      return MaterialPageRoute(builder: (_) => Mainscreen());

      case volunteerScreen : 
      return MaterialPageRoute(builder: (_) => Volunteerscreen());

      case withdrawPaymentDetails :
      return MaterialPageRoute(builder: (_) => Paymentdetailsscreen());

      case refferedPaymentScreen :
      return MaterialPageRoute(builder: (_) => Refferedpaymentscreen());

      case viewActivityScreen : 
      return MaterialPageRoute(builder: (_) => Viewactivitesscreen());

      default : 
      return MaterialPageRoute(builder: (_) =>Scaffold(
        body: Center(child:  Text('No routes defined for ${settings.name}'),),
      ));
    }
  }
}