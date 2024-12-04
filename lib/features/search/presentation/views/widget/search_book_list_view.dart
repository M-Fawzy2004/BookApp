import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/presentation/views/widget/book_list_item.dart';
import 'package:flutter/material.dart';

class SearchBooksListView extends StatelessWidget {
  const SearchBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookListItem(
          books: books[index],
        );
      },
    );
  }
}
