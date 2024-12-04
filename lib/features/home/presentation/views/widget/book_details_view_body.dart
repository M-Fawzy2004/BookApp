import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'book_action.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_book_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.books});

  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(books: books),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                BookAction(bookEntity: books),
                const Expanded(
                  child: SimilarBookSection(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
