import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderAnimation extends StatelessWidget {
  final int activeIndex;

  const SliderAnimation({
    super.key,
    required this.activeIndex,
    required this.book,
  });

  final List<BookEntity> book;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      count: 7,
      effect: WormEffect(
        dotWidth: 10.0,
        dotHeight: 10.0,
        dotColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      activeIndex: activeIndex,
    );
  }
}
