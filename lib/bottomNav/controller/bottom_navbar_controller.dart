import 'package:get/get.dart';

enum BnbItem { home, teams, wallet, dashboard, more }

class BottomNavController extends GetxController {
  var currentPage = BnbItem.home.obs;

  void changePage(BnbItem page) {
    currentPage.value = page;
  }
}
