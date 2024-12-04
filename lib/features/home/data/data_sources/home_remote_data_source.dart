import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/core/utils/functions/save_data.dart';
import 'package:booklyapp/features/home/data/model/book_model/book_model.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int featurePageNumber = 0});
  Future<List<BookEntity>> fetchNewsetsBooks({int newsetPageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({int similarPageNumber = 0});
  Future<List<BookEntity>> fetcSearchBooks();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp(this.apiService);

  // fetchFeaturedBooks
  @override
  Future<List<BookEntity>> fetchFeaturedBooks(
      {int featurePageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${featurePageNumber * 10}');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  // fetchNewsetsBooks
  @override
  Future<List<BookEntity>> fetchNewsetsBooks({int newsetPageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&sorting=newset&startIndex=${newsetPageNumber * 10}');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kNewsetBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks(
      {int similarPageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${similarPageNumber * 10}');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kSimilarBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetcSearchBooks() async {
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kSimilarBox);
    return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
