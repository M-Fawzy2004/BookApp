import 'package:auto_size_text/auto_size_text.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'booking_rating.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.books});

  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width * 0.38,
            child: CustomBookImage(image: books.image!),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        AutoSizeText(
          books.title,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: Styles.title1,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        AutoSizeText(
          books.autherName ?? '',
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Styles.titleLineLight(context).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        BookingRating(
          rating: books.rating,
          countRating: books.averageRating,
        ),
      ],
    );
  }
}
