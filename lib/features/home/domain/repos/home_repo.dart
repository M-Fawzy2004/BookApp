import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int featurePageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewsetsBooks(
      {int newsetPageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchSimilerBooks(
      {int similarPageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetcSearchBooks();
}
