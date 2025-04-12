import 'package:flutter/material.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_form_details.dart';
import 'package:adhisree_foundation/homescreen/donation_model/donation_pride_card.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:get/get.dart';

import '../../controllers/campaign_controller.dart';
import '../../utils/snackBar.dart';

class DonationModalScreen {
  static void showDonationPopup(BuildContext context, int campaignId) async {
    final CampaignController controller = Get.find();

    // Start fetching data
    controller.fetchCampaignwithPrice(campaignId);

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "DonationPopup",
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;

        return Obx(() {
          if (controller.isLoading.value ||
              controller.selectedCampaign.value == null) {
            // Skeleton loader while loading
            return Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: height * 0.60,
                    padding: EdgeInsets.fromLTRB(
                      width * 0.05,
                      width * 0.07,
                      width * 0.05,
                      width * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          height: height * 0.18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: height * 0.025),
                        Container(
                          width: width * 0.5,
                          height: 20,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 10),
                        // Container(
                        //   width: width * 0.9,
                        //   height: 40,
                        //   color: Colors.grey[300],
                        // ),
                        // SizedBox(height: height * 0.01),
                        // Container(
                        //   width: width * 0.4,
                        //   height: 20,
                        //   color: Colors.grey[300],
                        // ),
                        SizedBox(height: height * 0.01),
                        Container(
                          width: width * 0.9,
                          height: 40,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: List.generate(3, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Container(
                                width: 80,
                                height: height * 0.03,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.23,
                  left: width * 0.45,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: Colors.black),
                    ),
                  ),
                ),
              ],
            );
          }

          // After loading is complete
          final data = controller.selectedCampaign.value;
          final prices = data!.prices;
          int? selectedId;
          String? amount;
          String? name;

          return StatefulBuilder(
            builder: (context, setState) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: height * 0.68,
                      padding: EdgeInsets.fromLTRB(
                        width * 0.05,
                        width * 0.07,
                        width * 0.05,
                        width * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: GestureDetector(
                              child: Container(
                                width: width,
                                height: height * 0.18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(data.innerImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.025),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.titleOne,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w800,
                                  fontSize: width * 0.05,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(height: height * 0.001),
                              Container(
                                padding: EdgeInsets.all(width * 0.01),
                                child: Text(
                                  data.paraOne,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    fontSize: width * 0.035,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.titleTwo,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                  fontSize: width * 0.04,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Container(
                                padding: EdgeInsets.all(width * 0.01),
                                child: Text(
                                  data.paraTwo,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    fontSize: width * 0.035,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.02),
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Row(
                          //     children: prices.map((price) {
                          //       return Padding(
                          //         padding: const EdgeInsets.only(right: 16),
                          //         child: DonationPriceCard(
                          //           id: price.id,
                          //           amount: price.price,
                          //           name: price.priceName,
                          //           isSelected: selectedId == price.id,
                          //           onSelect: (selectedIdNew, selectedAmount, selectedName) {
                          //             setState(() {
                          //               selectedId = selectedIdNew;
                          //               amount = selectedAmount;
                          //               name = selectedName;
                          //             });
                          //           },
                          //         ),
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // "Choose your amount" card
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedId =
                                            0; // use a special ID for custom amount
                                      });
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          String customAmount = '';

                                          return StatefulBuilder(
                                            builder: (context, setState) {
                                              bool showError =
                                                  customAmount.isEmpty;

                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                title: Text(
                                                  "Amount",
                                                  style: TextStyle(
                                                    fontSize: width * 0.05,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Enter the amount you wish to donate:",
                                                      style: TextStyle(
                                                        fontSize: width * 0.04,
                                                        color: Colors.grey[700],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: height * 0.015),
                                                    TextField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      onChanged: (value) {
                                                        customAmount = value;
                                                        if (showError &&
                                                            value.isNotEmpty) {
                                                          setState(() {
                                                            showError = false;
                                                          });
                                                        }
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: "₹100",
                                                        filled: true,
                                                        fillColor:
                                                            Colors.grey[100],
                                                        contentPadding:
                                                            EdgeInsets.symmetric(
                                                                horizontal:
                                                                    width *
                                                                        0.03,
                                                                vertical:
                                                                    width *
                                                                        0.03),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          borderSide:
                                                              BorderSide(
                                                            color: showError
                                                                ? Colors.red
                                                                : Colors
                                                                    .transparent,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          borderSide:
                                                              BorderSide(
                                                            color: showError
                                                                ? Colors.red
                                                                : Color(
                                                                    0xFF1A73E8),
                                                            width: 1.5,
                                                          ),
                                                        ),
                                                      ),
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.05),
                                                    ),
                                                    if (showError)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 8.0,
                                                                left: 4),
                                                        child: Text(
                                                          "Please enter an amount",
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize: width *
                                                                  0.035),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                actionsPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 8),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    style: TextButton.styleFrom(
                                                      foregroundColor:
                                                          Colors.grey[600],
                                                    ),
                                                    child: Text("Cancel"),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      if (customAmount
                                                          .isEmpty) {
                                                        setState(() {
                                                          showError = true;
                                                        });
                                                      } else {
                                                        Navigator.pop(
                                                            context); // Close the input popup

                                                        showDialog(
                                                          context: context,
                                                          barrierDismissible:
                                                              true,
                                                          builder: (context) {
                                                            return Center(
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    DonationPopupForm(
                                                                  campaignId:
                                                                      data.id,
                                                                  priceId:
                                                                      selectedId,
                                                                  amount:
                                                                      customAmount,
                                                                  name:
                                                                      'Custom Amount',
                                                                  image: data
                                                                      .innerImage,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color(0XFF338D9B),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  width * 0.03,
                                                              vertical:
                                                                  width * 0.02),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "OK",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: width * 0.3,
                                      height: height * 0.12,
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 14, 16, 14),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF4F4F4),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: selectedId == 0
                                              ? Color(0xFF1A73E8)
                                              : Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Choose Your\nAmount",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: width * 0.030,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // existing price cards
                                ...prices.map((price) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: DonationPriceCard(
                                      id: price.id,
                                      amount: price.price,
                                      name: price.priceName,
                                      isSelected: selectedId == price.id,
                                      onSelect: (selectedIdNew, selectedAmount,
                                          selectedName) {
                                        setState(() {
                                          selectedId = selectedIdNew;
                                          amount = selectedAmount;
                                          name = selectedName;
                                        });
                                      },
                                    ),
                                  );
                                }).toList(),
                              ],
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
                                                campaignId: data.id,
                                                priceId: selectedId,
                                                amount: amount,
                                                name: name,
                                                image: data.innerImage),
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
                  Positioned(
                    top: height * 0.23,
                    left: width * 0.45,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        });
      },
    );
  }

  static Widget _buildTextSection(
      {required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          description,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
