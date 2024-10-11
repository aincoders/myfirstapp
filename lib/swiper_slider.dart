import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MySwiperSliderPage extends StatelessWidget {
  const MySwiperSliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://via.placeholder.com/600x400?text=Slide+1',
      'https://via.placeholder.com/600x400?text=Slide+2',
      'https://via.placeholder.com/600x400?text=Slide+3',
      'https://via.placeholder.com/600x400?text=Slide+4',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Swiper Example'),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            initialPage: 0,
            viewportFraction: 0.8,
          ),
          items: imgList.map((item) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(item, fit: BoxFit.cover, width: 1000.0),
            ),
          )).toList(),
        ),
      ),
    );
  }
}
