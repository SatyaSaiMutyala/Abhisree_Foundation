import 'package:adhisree_foundation/bottomNav/bottom_nav_bar.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/teamsController.dart';
import '../models/referralModel.dart';

class Innerreferalscreen extends StatefulWidget {
  final int id;
  const Innerreferalscreen({Key? key, required this.id}) : super(key: key);

  @override
  _InnerreferalscreenState createState() => _InnerreferalscreenState();
}

class _InnerreferalscreenState extends State<Innerreferalscreen> {
  final ReferralController referralController = Get.put(ReferralController());
  Key _refreshKey = UniqueKey();
  bool showPrimary = true;
  int? userId;
  Map<String, dynamic>? userData;
  String? role;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    referralController.fetchReferralData(widget.id.toString());
  }

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _refreshKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Get.off(BottomNavScreen(initialPageIndex: 1));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.off(BottomNavScreen(initialPageIndex: 1)),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Obx(() {
          if (referralController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          ReferralResponse? referralData =
              referralController.referralData.value;

          List<ReferralUser> primaryReferrals =
              referralData?.primaryReferral ?? [];

          List<ReferralUser> secondaryReferrals =
              referralData?.secondaryReferral ?? [];

          ReferralUser? currentUserData =
              referralController.referralData.value?.user;

          if (referralData == null || currentUserData == null) {
            return Center(
                child: CircularProgressIndicator()); // or a skeleton loader
          }

          List<ReferralUser> currentList =
              showPrimary ? primaryReferrals : secondaryReferrals;

          double currentProgress =
              double.tryParse(currentUserData?.progress ?? '0') ?? 0.0;

          final currentLevel = currentUserData.level ?? 0;
          final target = currentUserData.targetValue ?? 0;
          final progress = currentProgress / target;

          Color getLevelColor(String role, int level) {
            if (role == 'employee') {
              if (level < 3) return Colors.red;
              if (level == 3) return Colors.orange;
              return Colors.green; // level 4 or 5
            } else if (role == 'volunteer') {
              if (level < 6) return Colors.red;
              if (level < 9) return Colors.orange;
              return Colors.green; // 9 or above
            }
            return Colors.grey; // default fallback
          }

          return Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: height * 0.42,
                    decoration: BoxDecoration(
                      color: Color(0xFF338D9B),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(width * 0.09),
                        bottomRight: Radius.circular(width * 0.09),
                      ),
                    ),
                  ),
                  Positioned(
                    top: width * 0.15,
                    right: width * 0.04,
                    child: Container(
                      width: width * 0.04,
                      height: height * 0.04,
                      decoration: BoxDecoration(
                        color: getLevelColor(role.toString(), currentLevel),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: width * 0.15,
                    child: Container(
                      width: width * 0.25,
                      height: height * 0.12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 6),
                        image: DecorationImage(
                          image: (currentUserData?.photoPath != null &&
                                  currentUserData!.photoPath!.isNotEmpty)
                              ? NetworkImage('${currentUserData.photoPath!}')
                              : const AssetImage('assets/images/Png/user.png')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: width * 0.44,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        (currentUserData?.firstName?.isNotEmpty == true &&
                                currentUserData?.lastName?.isNotEmpty == true)
                            ? '${currentUserData!.firstName} ${currentUserData.lastName}'
                            : 'No Name',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.04,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Positioned(
                    top: width * 0.504,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        (currentUserData?.userType.isNotEmpty == true)
                            ? '${currentUserData!.userType}'.toUpperCase()
                            : 'No Role',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.036,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Positioned(
                    top: width * 0.58,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.viewActivityScreen);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.06),
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          border:
                              Border.all(color: Color(0xFFCFCBCB), width: 0.55),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "View activities",
                              style: TextStyle(
                                fontSize: width * 0.028,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontFamily: 'Inter',
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: width * 0.75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.7,
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Color(0xFFEDEDED),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF136571)),
                            minHeight: height * 0.012,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusDefault),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        SizedBox(
                          width: width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Level : $currentLevel",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: width * 0.034,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${currentProgress.floor()}/$target",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: width * 0.034,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: width * 2,
                margin: EdgeInsets.only(top: width * 0.06, left: width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showPrimary = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Primary Referrals",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight:
                                showPrimary ? FontWeight.w600 : FontWeight.w500,
                            fontSize: width * 0.038,
                            color:
                                showPrimary ? Colors.black : Color(0xFFB8B5B5),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showPrimary = false;
                        });
                      },
                      child: Container(
                        width: width * 0.5,
                        alignment: Alignment.center,
                        child: Text(
                          "Secondary Referral",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight:
                                showPrimary ? FontWeight.w500 : FontWeight.w600,
                            fontSize: width * 0.038,
                            color:
                                showPrimary ? Color(0xFFB8B5B5) : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * 0.9,
                margin: EdgeInsets.only(top: width * 0.02),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFDEDEDE), width: 1),
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: currentList.isEmpty
                      ? ListView(
                          key: _refreshKey,
                          physics: AlwaysScrollableScrollPhysics(),
                          children: [
                            SizedBox(height: 100),
                            Center(
                              child: Text(
                                "No Referrals",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        )
                      : ListView.builder(
                          key: _refreshKey,
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.only(
                            left: width * 0.01,
                            right: width * 0.02,
                            top: width * 0.02,
                          ),
                          itemCount: currentList.length,
                          itemBuilder: (context, index) {
                            final member = currentList[index];
                            return Column(
                              children: [
                                Container(
                                  width: width * 0.9,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.01,
                                      vertical: width * 0.015),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => Get.offAll(
                                            Innerreferalscreen(id: member.id)),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: member
                                                          .photoPath !=
                                                      null
                                                  ? NetworkImage(
                                                      member.photoPath!)
                                                  : AssetImage(
                                                          'assets/images/Png/user.png')
                                                      as ImageProvider,
                                              radius: width * 0.07,
                                            ),
                                            SizedBox(width: width * 0.03),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  member.firstName ?? '',
                                                  style: TextStyle(
                                                    fontSize: width * 0.034,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: height * 0.003),
                                                Text(
                                                  member.lastName ?? '',
                                                  style: TextStyle(
                                                    fontSize: width * 0.03,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF7D7D7D),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final Uri phoneUri = Uri(
                                              scheme: 'tel',
                                              path: member.phoneNumber);
                                          if (await canLaunchUrl(phoneUri)) {
                                            await launchUrl(phoneUri);
                                          } else {
                                            print('Could not launch dialer');
                                          }
                                        },
                                        child: Text(
                                          member.phoneNumber ?? '',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: width * 0.03,
                                            color: Color(0xFF6F6B6B),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: width * 0.9,
                                  height: 1,
                                  margin: EdgeInsets.symmetric(
                                      vertical: width * 0.02),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xFFE5E5E5), width: 1),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
