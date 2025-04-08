// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:adhisree_foundation/utils/dimensions.dart';

// class SliderScreen extends StatelessWidget {
//   final List<String> imageList = [
//     'assets/images/Png/slider1.png',
//     'assets/images/Png/slider1.png',
//     'assets/images/Png/slider1.png',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width ;
//     double height  = MediaQuery.of(context).size.height ;

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: width * 0.06),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(width * 0.04),
//         child: CarouselSlider(
//           options: CarouselOptions(
//             height: height * 0.17,
//             autoPlay: true,
//             enlargeCenterPage: true,
//             viewportFraction: 1.0,
//           ),
//           items: imageList.map((imagePath) {
//             return Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
//               ),
//               child: Image.asset(
//                 imagePath,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: height * 0.17,
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }



import 'package:adhisree_foundation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/slider_controller.dart';

class SliderScreen extends StatelessWidget {
  final SliderController sliderController = Get.put(SliderController());

   /// Shimmer Effect for Skeleton Loading
  Widget _buildShimmerLoader(double height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: height * 0.17,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width * 0.04),
        child: Obx(() {
          if (sliderController.isLoading.value) {
            return _buildShimmerLoader(height);
          }
          if (sliderController.bannerList.isEmpty) {
            return Center(child: Text("No banners available"));
          }
          return CarouselSlider(
            options: CarouselOptions(
              height: height * 0.17,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
            ),
            items: sliderController.bannerList.map((banner) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  banner.bannerPath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: height * 0.17,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text("Image failed to load"));
                  },
                ),
              );
            }).toList(),
          );
        }),
      ),
    );
  }
}
