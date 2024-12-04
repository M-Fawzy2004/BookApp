import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'widget/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.books});

  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(
        books: books,
      ),
    );
  }
}
