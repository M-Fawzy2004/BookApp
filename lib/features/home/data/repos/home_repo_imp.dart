import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklyapp/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImp(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int featurePageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBooks(
        featurePageNumber: featurePageNumber,
      );
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks(
        featurePageNumber: featurePageNumber,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsetsBooks(
      {int newsetPageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewsetsBooks(
        newsetPageNumber: newsetPageNumber,
      );
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewsetsBooks(
        newsetPageNumber: newsetPageNumber,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilerBooks(
      {int similarPageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchSimilarBooks(
        similarPageNumber: similarPageNumber,
      );
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchSimilarBooks(
        similarPageNumber: similarPageNumber,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetcSearchBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetcSearchBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetcSearchBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
