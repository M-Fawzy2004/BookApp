import 'package:auto_size_text/auto_size_text.dart';
import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/presentation/views/widget/booking_rating.dart';
import 'package:booklyapp/features/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/styles.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({super.key, required this.books});

  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kDetailsView, extra: books);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 15),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.height * 0.1,
                child: CustomBookImage(image: books.image ?? 'ERROR'),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    books.title,
                    style: Styles.title.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: kFontBold,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 5),
                  AutoSizeText(
                    books.autherName ?? 'No Auther',
                    maxLines: 1,
                    style: Styles.titleLineLight(context),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        'FREE',
                        style: Styles.title3.copyWith(
                          fontFamily: kFont,
                        ),
                      ),
                      BookingRating(
                        rating: books.rating,
                        countRating: books.averageRating,
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
