part of 'newset_book_cubit.dart';

@immutable
sealed class NewsetBookState {}

final class NewsetBookInitial extends NewsetBookState {}

final class NewsetBookLoading extends NewsetBookState {}

final class NewsetBookPaginationLoading extends NewsetBookState {}

final class NewsetBookPaginationFailure extends NewsetBookState {
  final String errMessage;

  NewsetBookPaginationFailure(this.errMessage);
}

final class NewsetBookSuccess extends NewsetBookState {
  final List<BookEntity> books;

  NewsetBookSuccess(this.books);
}

final class NewsetBookFailure extends NewsetBookState {
  final String message;

  NewsetBookFailure(this.message);
}
