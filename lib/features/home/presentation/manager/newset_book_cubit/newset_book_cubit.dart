// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/domain/use_case/fetch_newset_book_use_case.dart';
import 'package:meta/meta.dart';
part 'newset_book_state.dart';

class NewsetBookCubit extends Cubit<NewsetBookState> {
  NewsetBookCubit(this.fetchNewsetBookUseCase) : super(NewsetBookInitial());

  final FetchNewsetBookUseCase fetchNewsetBookUseCase;

  Future<void> fetchNewsetBook({int newsetPageNumber = 0}) async {
    if (newsetPageNumber == 0) {
      emit(NewsetBookLoading());
    } else {
      emit(NewsetBookPaginationLoading());
    }
    var result = await fetchNewsetBookUseCase.call(newsetPageNumber);
    return result.fold((failure) {
      if (newsetPageNumber == 0) {
        emit(NewsetBookFailure(failure.message));
      } else {
        emit(NewsetBookPaginationFailure(failure.message));
      }
    }, (success) {
      emit(NewsetBookSuccess(success));
    });
  }
}
