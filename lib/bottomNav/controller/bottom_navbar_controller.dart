import 'package:get/get.dart';

enum BnbItem { home, teams, wallet, referrals, more }

class BottomNavController extends GetxController {
  var currentPage = BnbItem.home.obs;

  void changePage(BnbItem page) {
    currentPage.value = page;
  }
}
