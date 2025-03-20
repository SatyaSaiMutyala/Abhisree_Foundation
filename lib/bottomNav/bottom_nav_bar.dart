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
  const BottomNavScreen({Key? key, required this.initialPageIndex}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late int _pageIndex;

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.initialPageIndex;

    // Delay the state update until after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<BottomNavController>().changePage(BnbItem.values[_pageIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(() => _getBody(Get.find<BottomNavController>().currentPage.value)),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF0F0F0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFFF0F0F0),
            currentIndex: _pageIndex,
            onTap: (index) {
              setState(() {
                _pageIndex = index;
              });
              Get.find<BottomNavController>().changePage(BnbItem.values[index]);
            },
            selectedItemColor: Color(0xFF338D9B),
            unselectedItemColor: Color(0xFF747272),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: _getNavIcon("House", _pageIndex == 0),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: _getNavIcon("UsersThree", _pageIndex == 1),
                label: "Teams",
              ),
              BottomNavigationBarItem(
                icon: _getNavIcon("Wallet", _pageIndex == 2),
                label: "Wallet",
              ),
              BottomNavigationBarItem(
                icon: _getNavIcon("UserSwitch", _pageIndex == 3),
                label: "Refer",
              ),
              BottomNavigationBarItem(
                icon: _getNavIcon("DotsThreeOutline", _pageIndex == 4),
                label: "More",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getNavIcon(String iconName, bool isSelected) {
    String iconPath = isSelected
        ? "assets/images/Png/active_$iconName.png"
        : "assets/images/Png/Inactive_$iconName.png";
    return Image.asset(
      iconPath,
      width: 24,
      height: 24,
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


