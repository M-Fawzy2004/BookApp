import 'package:booklyapp/core/widget/custom_fading_widget.dart';
import 'package:booklyapp/features/home/presentation/views/widget/custom_book_image_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ScrollAnimationListViewLoading extends StatelessWidget {
  const ScrollAnimationListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: CarouselSlider.builder(
        itemCount: 5,
        itemBuilder: (context, index, realIndex) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomBookImageLoading(),
          );
        },
        options: CarouselOptions(
          autoPlayInterval: const Duration(seconds: 5),
          height: MediaQuery.of(context).size.height * 0.26,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          viewportFraction: 0.4,
        ),
      ),
    );
  }
}
