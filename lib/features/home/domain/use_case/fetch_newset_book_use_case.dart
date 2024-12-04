import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/core/use_case/use_case.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewsetBookUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewsetBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) {
    return homeRepo.fetchNewsetsBooks(
      newsetPageNumber: param,
    );
  }
}
