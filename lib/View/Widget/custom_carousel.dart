import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  final List<String> images =[
    "assets/slider1.png",
    "assets/slider1.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 38, top: 15),
          child: CarouselSlider(
              items: images.map((image) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child:Image.asset(image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ));
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false  ,
                onPageChanged: (index,reason){
                  setState(() {
                    _currentIndex = index;
                  });
                }
              ),
            carouselController: _carouselController,
          ),
        ),
        Positioned(
            left: 1,
            child: IconButton(
                onPressed: ()=> _carouselController.previousPage(),
                icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.grey,)
            )
        ),
        Positioned(
            right: 0,
            child: IconButton(
                onPressed: ()=> _carouselController.nextPage(),
                icon: Icon(Icons.arrow_forward_ios, size: 30, color: Colors.grey,)
            )
        )
      ],
    );
  }
}
