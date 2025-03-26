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
    return Scaffold(
      body: Obx(() => _getBody(Get.find<BottomNavController>().currentPage.value)),
      bottomNavigationBar: BottomNavigationBar(
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
          _buildNavItem("home_icon", "Home", 0),
          _buildNavItem("teams_icon", "Teams", 1),
          _buildNavItem("wallet_icon", "Wallet", 2),
          _buildNavItem("refer_icon", "Refer", 3),
          _buildNavItem("more_icon", "More", 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String assetName, String label, int index) {
    return BottomNavigationBarItem(
      icon: ColorFiltered(
        colorFilter: ColorFilter.mode(
          _pageIndex == index ? Color(0xFF338D9B) : Color(0xFF747272),
          BlendMode.srcIn,
        ),
        child: Image.asset("assets/icons/$assetName.png", width: 24, height: 24),
      ),
      label: label,
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
