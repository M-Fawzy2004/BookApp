part of 'search_books_cubit.dart';

@immutable
sealed class SearchBooksState {}

final class SearchBookInitial extends SearchBooksState {}

final class SearchBookLoading extends SearchBooksState {}

final class SearchBookSuccess extends SearchBooksState {
  final List<BookEntity> book;

  SearchBookSuccess(this.book);
}

final class SearchBookFailure extends SearchBooksState {
  final String errMessage;

  SearchBookFailure(this.errMessage);
}
