import 'package:adhisree_foundation/controllers/donationCategoryController.dart';
import 'package:adhisree_foundation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DonationCategoryScreen extends StatelessWidget {
  final controller = Get.put(DonationCategoryController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.07),
            child: Text(
              "Donation Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.05,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),

          controller.isLoading.value
              ? shimmerList(width, height)
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: width * 0.07),
                  child: Row(
                    children: controller.categories.map((category) {
                      return Padding(
                        padding: EdgeInsets.only(right: width * 0.03),
                        child: Container(
                          width: width * 0.3,
                          height: height * 0.13,
                          padding: EdgeInsets.symmetric(
                            vertical: width * 0.02,
                            horizontal: width * 0.02,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F3F3),
                            borderRadius:
                                BorderRadius.circular(width * 0.02),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "${imagePath}/${category.image}",
                                width: width * 0.1,
                                height: width * 0.1,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.broken_image, size: width * 0.1),
                              ),
                              SizedBox(height: height * 0.007),
                              Text(
                                category.title,
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .shadowColor
                                      .withOpacity(0.8),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ],
      );
    });
  }

  // 👇 Shimmer Skeleton Widget
  Widget shimmerList(double width, double height) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: width * 0.07),
      child: Row(
        children: List.generate(4, (index) {
          return Padding(
            padding: EdgeInsets.only(right: width * 0.03),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: width * 0.3,
                height: height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
