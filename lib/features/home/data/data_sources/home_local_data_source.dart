import 'package:booklyapp/constant.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int featurePageNumber = 0});
  List<BookEntity> fetchNewsetsBooks({int newsetPageNumber = 0});
  List<BookEntity> fetchSimilarBooks({int similarPageNumber = 0});
  List<BookEntity> fetcSearchBooks();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int featurePageNumber = 0}) {
    int startIndex = featurePageNumber * 10;
    int endIndex = (featurePageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;

    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewsetsBooks({int newsetPageNumber = 0}) {
    int startIndex = newsetPageNumber * 10;
    int endIndex = (newsetPageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kNewsetBox);
    int length = box.values.length;

    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchSimilarBooks({int similarPageNumber = 0}) {
    int startIndex = similarPageNumber * 10;
    int endIndex = (similarPageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kSimilarBox);
    int length = box.values.length;

    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList();
  }

  @override
  List<BookEntity> fetcSearchBooks() {
    var box = Hive.box<BookEntity>(kSimilarBox);
    return box.values.toList();
  }
}
