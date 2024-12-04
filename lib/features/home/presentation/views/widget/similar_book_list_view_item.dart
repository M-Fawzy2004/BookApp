import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimilarBookListViewItem extends StatelessWidget {
  const SimilarBookListViewItem({super.key, required this.books});

  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView, extra: books);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.23,
          child: CustomBookImage(image: books.image ?? ''),
        ),
      ),
    );
  }
}
