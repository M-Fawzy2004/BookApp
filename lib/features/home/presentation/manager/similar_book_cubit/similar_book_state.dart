part of 'similar_book_cubit.dart';

@immutable
sealed class SimilarBookState {}

final class SimilarBookInitial extends SimilarBookState {}

final class SimilarBookLoading extends SimilarBookState {}

final class SimilarBookPaginationLoading extends SimilarBookState {}

final class SimilarBookPaginationFailure extends SimilarBookState {
  final String errMessage;

  SimilarBookPaginationFailure(this.errMessage);
}

final class SimilarBookSuccess extends SimilarBookState {
  final List<BookEntity> book;

  SimilarBookSuccess(this.book);
}

final class SimilarBookFailure extends SimilarBookState {
  final String errMessage;

  SimilarBookFailure(this.errMessage);
}
