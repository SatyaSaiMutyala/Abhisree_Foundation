import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';

class SliderScreen extends StatelessWidget {
  final List<String> imageList = [
    'assets/slider1.png',
    'assets/slider1.png',
    'assets/slider1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
        child: CarouselSlider(
          options: CarouselOptions(
            height: Dimensions.sliderImageWidth,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
          ),
          items: imageList.map((imagePath) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: Dimensions.sliderImageWidth,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
