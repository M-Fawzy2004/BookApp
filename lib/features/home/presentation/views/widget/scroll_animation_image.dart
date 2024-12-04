import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widget/custom_book_image.dart';
import 'package:booklyapp/features/home/presentation/views/widget/slider_smooth_animation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScrollAnimationImage extends StatefulWidget {
  const ScrollAnimationImage({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<ScrollAnimationImage> createState() => _ScrollAnimationImageState();
}

class _ScrollAnimationImageState extends State<ScrollAnimationImage> {
  int activeIndex = 0;
  var nextPage = 1;
  bool isLoading = false;

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.books.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kDetailsView,
                    extra: widget.books[index],
                  );
                },
                child: CustomBookImage(
                  image: widget.books[index].image ?? '',
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 5),
            height: MediaQuery.of(context).size.height * 0.26,
            autoPlay: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
              if (index / widget.books.length >= 0.9) {
                if (!isLoading) {
                  isLoading = true;
                  BlocProvider.of<FeaturedBookCubit>(context)
                      .fetchFeauturedBooks(featurePageNumber: nextPage++);
                  isLoading = false;
                }
              }
            },
            viewportFraction: 0.4,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SliderAnimation(
          activeIndex: activeIndex,
          book: widget.books,
        ),
      ],
    );
  }
}
