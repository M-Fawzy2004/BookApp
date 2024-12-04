// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/domain/use_case/fetch_similar_book_use_case.dart';
import 'package:meta/meta.dart';
part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.fetchSimilarBookUseCase) : super(SimilarBookInitial());

  final FetchSimilarBookUseCase fetchSimilarBookUseCase;

  Future<void> fetchSimilarBooks({int similarPageNumber = 0}) async {
    if (similarPageNumber == 0) {
      emit(SimilarBookLoading());
    } else {
      emit(SimilarBookPaginationLoading());
    }
    var result = await fetchSimilarBookUseCase.call(similarPageNumber);
    return result.fold((failure) {
      if (similarPageNumber == 0) {
        emit(SimilarBookFailure(failure.message));
      } else {
        emit(SimilarBookPaginationFailure(failure.message));
      }
    }, (success) {
      emit(SimilarBookSuccess(success));
    });
  }
}
