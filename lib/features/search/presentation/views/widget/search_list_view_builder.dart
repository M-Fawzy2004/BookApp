import 'package:booklyapp/features/search/presentation/views/widget/search_book_list_item.dart';
import 'package:flutter/cupertino.dart';

// ignore: non_constant_identifier_names
ListView SearchListViewBuilder(List<dynamic> books) {
  return ListView.builder(
    itemCount: books.length,
    itemBuilder: (context, index) {
      final book = books[index]['volumeInfo'];
      final title = book['title'] ?? 'Unknown Title';
      final autherName =
          (book['authors'] as List<dynamic>?)?.join(', ') ?? 'Unknown Author';
      final image = book['imageLinks']?['thumbnail'] ?? '';
      final rating = (book['averageRating'] ?? 0).toString();
      final ratingsCount = (book['ratingsCount'] ?? 0).toString();

      return SearchBookListItem(
        title: title,
        autherName: autherName,
        image: image,
        rating: rating,
        ratingsCount: ratingsCount,
      );
    },
  );
}
