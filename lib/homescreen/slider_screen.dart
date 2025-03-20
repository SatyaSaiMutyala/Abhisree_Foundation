import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:adhisree_foundation/utils/dimensions.dart';

class SliderScreen extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/Png/slider1.png',
    'assets/images/Png/slider1.png',
    'assets/images/Png/slider1.png',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height  = MediaQuery.of(context).size.height ;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width * 0.04),
        child: CarouselSlider(
          options: CarouselOptions(
            height: height * 0.17,
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
                height: height * 0.17,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
