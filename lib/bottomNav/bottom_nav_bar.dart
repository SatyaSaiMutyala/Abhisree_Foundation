import 'package:adhisree_foundation/bottomNav/controller/bottom_navbar_controller.dart';
import 'package:adhisree_foundation/homescreen/home_screen.dart';
import 'package:adhisree_foundation/more_section/settings_screen.dart';
import 'package:adhisree_foundation/teams/referrals_screen.dart';
import 'package:adhisree_foundation/teams/teams_screen.dart';
import 'package:adhisree_foundation/wallet/wallet_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  final int initialPageIndex;
  const BottomNavScreen({Key? key, required this.initialPageIndex})
      : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late int _pageIndex;

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.initialPageIndex;
    Get.find<BottomNavController>().changePage(BnbItem.values[_pageIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(() =>
              _getBody(Get.find<BottomNavController>().currentPage.value)),
        ),
        Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF0F0F0), // Set background color
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: _pageIndex,
              onTap: (index) {
                setState(() {
                  _pageIndex = index;
                });
                Get.find<BottomNavController>()
                    .changePage(BnbItem.values[index]);
              },
              selectedItemColor: Color(0xFF338D9B),
              unselectedItemColor: Color(0xFF747272),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/home_icon.png",
                    width: 24,
                    height: 24,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/teams_icon.png",
                      width: 24,
                      height: 24,
                    ),
                    label: "Teams"),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/wallet_icon.png",
                      width: 24,
                      height: 24,
                    ),
                    label: "Wallet"),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/refer_icon.png",
                      width: 24,
                      height: 24,
                    ),
                    label: "Refer"),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/more_icon.png",
                      width: 24,
                      height: 24,
                    ),
                    label: "More"),
              ],
            )),
      ],
    );
  }

  Widget _getBody(BnbItem currentPage) {
    switch (currentPage) {
      case BnbItem.home:
        return HomeScreen();
      case BnbItem.teams:
        return TeamsScreen();
      case BnbItem.wallet:
        return WalletScreen();
      case BnbItem.referrals:
        return ReferralsScreen();
      case BnbItem.more:
        return MoreScreen();
    }
  }
}
