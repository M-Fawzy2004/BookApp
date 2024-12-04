import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/core/use_case/use_case.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSearchBookUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchSearchBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) {
    return homeRepo.fetcSearchBooks();
  }
}
