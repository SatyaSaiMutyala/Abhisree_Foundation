import 'package:adhisree_foundation/homescreen/donation_model/donation_pride_card.dart';
import 'package:adhisree_foundation/utils/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:adhisree_foundation/homescreen/donation_model/donation_form_details.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/controllers/campaign_controller.dart';

class DonationDetailsScreen extends StatefulWidget {
  final int id;
  final String golePrice;
  final int totalDonation;

  const DonationDetailsScreen({
    Key? key,
    required this.id,
    required this.golePrice,
    required this.totalDonation,
  }) : super(key: key);

  @override
  State<DonationDetailsScreen> createState() => _DonationDetailsScreenState();
}

class _DonationDetailsScreenState extends State<DonationDetailsScreen> {
  final CampaignController controller = Get.find();
  int? selectedId;
  String? amount;
  String? name;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchCampaignwithPrice(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        final isLoading = controller.isLoading.value;
        final data = controller.selectedCampaign.value;

        if (isLoading) {
          return Center(
            child: CircularProgressIndicator(color: Color(0XFF338D9B)),
          );
        }

        double progressPercent = 0.0;
        int goal = int.tryParse(widget.golePrice) ?? 1;
        progressPercent = (widget.totalDonation / goal).clamp(0.0, 1.0);

        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.38),
                    Text(
                      "Below poverty level students",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.04,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: height * 0.01,
                          decoration: BoxDecoration(
                            color: Color(0xFFEDEDED),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          width: width * progressPercent,
                          height: height * 0.01,
                          decoration: BoxDecoration(
                            color: Color(0XFF338D9B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹${widget.totalDonation} Raised",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.032,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "₹${widget.golePrice} Goal",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.032,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      data?.titleOne ?? '',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.038,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      data?.paraOne ?? '',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.03,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      data?.titleTwo ?? '',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.034,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      data?.paraTwo ?? '',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.03,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.027),
                    Text(
                      "Select your amount",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.034,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: data!.prices.map((price) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: DonationPriceCard(
                              id: price.id,
                              amount: price.price,
                              name: price.priceName,
                              isSelected: selectedId == price.id,
                              onSelect: (selectedIdNew, amount, selectedName) {
                                setState(() {
                                  selectedId = selectedIdNew;
                                  amount = amount;
                                  name = selectedName;
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    CustomButton(
                      text: 'SEND YOUR DONATION',
                      onPressed: () {
                        if (selectedId == null) {
                          showErrorSnackbar("Please select the amount");
                        } else {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: DonationPopupForm(
                                        campaignId: data!.id,
                                        priceId: selectedId,
                                        amount: amount,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Image Display
            Positioned(
              top: width * 0.24,
              left: width * 0.05,
              right: width * 0.05,
              child: Container(
                width: double.infinity,
                height: height * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.035),
                  image: DecorationImage(
                    image: NetworkImage(data!.innerImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Back button
            Positioned(
              top: width * 0.1,
              left: width * 0.02,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Share button
            Positioned(
              top: width * 0.1,
              right: width * 0.02,
              child: IconButton(
                icon: Image.asset("assets/icons/share_icon.png",
                    color: Colors.black, width: 24),
                onPressed: () {
                  // Share functionality here
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
