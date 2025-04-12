import 'package:adhisree_foundation/homescreen/donation_model/DonationSummary.dart';
import 'package:adhisree_foundation/homescreen/donation_model/VolunteerSummary.dart';
import 'package:adhisree_foundation/loginScreen/userDetailsScreen.dart';
import 'package:adhisree_foundation/teams/InnerReferalScreen.dart';
import 'package:flutter/material.dart';

import 'package:adhisree_foundation/homescreen/donation_model/volunteer_membership.dart';
import 'package:adhisree_foundation/homescreen/searchScreen.dart';
import 'package:adhisree_foundation/teams/viewActivitesScreen.dart';
import 'package:adhisree_foundation/wallet/paymentDetailsScreen.dart';
import 'package:adhisree_foundation/wallet/refferedPaymentScreen.dart';
import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/widgets/success_screen.dart';
import 'package:adhisree_foundation/homescreen/MainScreen.dart';
import 'package:adhisree_foundation/homescreen/volunteerScreen.dart';
import 'package:adhisree_foundation/loginScreen/OtpScreen.dart';
import 'package:adhisree_foundation/loginScreen/loginWithNumberScreen.dart';
import 'package:adhisree_foundation/loginScreen/messageScreen.dart';
import 'package:adhisree_foundation/loginScreen/referralCodeScreen.dart';

class AppRoutes {
  static const String messageScreen = '/';
  static const String LoginWithNumber = '/login';
  static const String OtpScreen = '/otp';
  static const String referralCode = '/referral';
  static const String mainScreen = '/main';
  static const String volunteerScreen = '/volunteer';
  static const String withdrawPaymentDetails = '/withdrawPaymentDetails';
  static const String refferedPaymentScreen = '/refferedPaymentScreen';
  static const String viewActivityScreen = '/viewActivityScreen';
  static const String bottomNavBar = '/bottomNav';
  static const String volunteerMembership = '/volunteerMembership';
  static const String successScreen = '/successScreen';
  static const String searchScreen = '/search';
  static const String userDetails = '/userDetails';
  static const String donationSummary = '/donationSummary';
  static const String volunteerSummary = '/volunteerSummary';
  static const String InnerReferalScreen = '/innerReferalScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case messageScreen:
        return MaterialPageRoute(builder: (_) => Messagescreen());

      case LoginWithNumber:
        return MaterialPageRoute(builder: (_) => Loginwithnumberscreen());

      case OtpScreen:
        return MaterialPageRoute(builder: (_) => Otpscreen());

      case referralCode:
        return MaterialPageRoute(builder: (_) => Referralcodescreen());

      case mainScreen:
        return MaterialPageRoute(builder: (_) => Mainscreen());

      case volunteerScreen:
        return MaterialPageRoute(builder: (_) => Volunteerscreen());

      case withdrawPaymentDetails:
        return MaterialPageRoute(
            builder: (_) => Paymentdetailsscreen(), settings: settings);

      case refferedPaymentScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => Refferedpaymentscreen(data: args));

      case viewActivityScreen:
        return MaterialPageRoute(builder: (_) => Viewactivitesscreen());

      case volunteerMembership:
        return MaterialPageRoute(builder: (_) => VolunteerMembership());

      case successScreen:
        return MaterialPageRoute(builder: (_) => SuccessScreen());

      case searchScreen:
        return MaterialPageRoute(builder: (_) => SearchScreen());

      case userDetails:
        return MaterialPageRoute(builder: (_) => UserDetailsScreen());

      case donationSummary:
      final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => Donationsummary(data : args));

      case volunteerSummary:
      final args = settings.arguments as Map<String, dynamic> ;
        return MaterialPageRoute(builder: (_) => Volunteersummary( data : args));

      case InnerReferalScreen:
        final args = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => Innerreferalscreen(id: args));

      case bottomNavBar:
        final int initialIndex = settings.arguments as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => BottomNavScreen(initialPageIndex: initialIndex),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No routes defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
