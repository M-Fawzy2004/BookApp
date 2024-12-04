import 'package:auto_size_text/auto_size_text.dart';
import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/presentation/views/widget/booking_rating.dart';
import 'package:booklyapp/features/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchBookListItem extends StatelessWidget {
  const SearchBookListItem({
    super.key,
    required this.title,
    required this.autherName,
    required this.image,
    required this.rating,
    required this.ratingsCount,
  });

  final dynamic title;
  final String autherName;
  final dynamic image;
  final String rating;
  final String ratingsCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          final bookEntity = BookEntity(
            title: title,
            autherName: autherName,
            image: image,
            rating: num.tryParse(rating) ?? 0,
            averageRating: num.tryParse(ratingsCount) ?? 0,
            url: '',
            price: 0,
          );
          GoRouter.of(context).push(AppRouter.kDetailsView, extra: bookEntity);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 15),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.height * 0.1,
                child: CustomBookImage(image: image),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    title,
                    style: Styles.title.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: kFontBold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  AutoSizeText(
                    autherName,
                    style: Styles.titleLineLight(context).copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        'FREE',
                        style: Styles.title3.copyWith(
                          fontFamily: kFont,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      BookingRating(
                        rating: num.tryParse(rating) ?? 0,
                        countRating: num.tryParse(ratingsCount) ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
