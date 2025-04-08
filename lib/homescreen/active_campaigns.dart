

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/campaign_controller.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_details_screen.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_modal_screen.dart';
import 'package:adhisree_foundation/utils/customButton.dart';

class ActiveCampaigns extends StatefulWidget {
  @override
  _ActiveCampaignsState createState() => _ActiveCampaignsState();
}

class _ActiveCampaignsState extends State<ActiveCampaigns> {
  final CampaignController controller = Get.put(CampaignController());
  int campaign_id = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.campaigns.isNotEmpty) {
        for (var campaign in controller.campaigns) {
          campaign_id = campaign.id;
          print("Campaign ID: ${campaign.id}");
        }
      }
    });
  }

  void handleGetPopup(context, id) {
    DonationModalScreen.showDonationPopup(context, id);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.07),
          child: Text(
            "Active Campaigns",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: width * 0.05,
              color: Colors.black,
            ),
          ),
        ),
        Obx(() {
          if (controller.isLoading.value) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.008),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: double.infinity,
                      height: height * 0.42,
                      padding: EdgeInsets.all(width * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width * 0.04),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: height * 0.16,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(width * 0.04),
                            ),
                          ),
                          SizedBox(height: height * 0.025),
                          Container(
                            height: height * 0.02,
                            width: width * 0.4,
                            color: Colors.grey,
                          ),
                          SizedBox(height: height * 0.02),
                          Container(
                            width: double.infinity,
                            height: height * 0.01,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                          ),
                          SizedBox(height: height * 0.015),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height * 0.02,
                                width: width * 0.25,
                                color: Colors.grey,
                              ),
                              Container(
                                height: height * 0.02,
                                width: width * 0.25,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.025),
                          Container(
                            height: height * 0.05,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(width * 0.02),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          if (controller.campaigns.isEmpty) {
            return Center(child: Text("No Active Campaigns"));
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.campaigns.length,
            itemBuilder: (context, index) {
              final campaign = controller.campaigns[index];
              return Padding(
                padding: EdgeInsets.fromLTRB( width * 0.05, 0,width * 0.05,  height * 0.02),
                
                child: Container(
                  width: double.infinity,
                  height: height * 0.42,
                  padding: EdgeInsets.all(width * 0.04),
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(width * 0.04),
                    border: Border.all(color: Color(0xFFEDEDED), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DonationDetailsScreen(
                                id: campaign.id,
                                golePrice: campaign.goalPrice,
                                totalDonation: campaign.totalDonation,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * 0.16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.04),
                            image: DecorationImage(
                              image: NetworkImage(campaign.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.025),
                      Text(
                        campaign.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.04,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: height * 0.01,
                            decoration: BoxDecoration(
                              color: Color(0xFFEDEDED),
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                          ),
                          Container(
                            width: width *
                                (campaign.totalDonation / double.parse(campaign.goalPrice)) *
                                0.9,
                            height: height * 0.01,
                            decoration: BoxDecoration(
                              color: Color(0XFF338D9B),
                              borderRadius: BorderRadius.circular(width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹${campaign.totalDonation} Raised",
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF6F6B6B),
                            ),
                          ),
                          Text(
                            "₹${campaign.goalPrice} Goal",
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF6F6B6B),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      CustomButton(
                        text: "Donate Now",
                        onPressed: () async {
                          handleGetPopup(context, campaign.id);
                        },
                        outlined: true,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}

