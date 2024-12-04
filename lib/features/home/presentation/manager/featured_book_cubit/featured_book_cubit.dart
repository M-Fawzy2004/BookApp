// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/domain/use_case/fetch_feature_book_use_case.dart';
import 'package:meta/meta.dart';
part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featureBookUseCase) : super(FeaturedBookInitial());

  final FetchFeatureBookUseCase featureBookUseCase;

  Future<void> fetchFeauturedBooks({int featurePageNumber = 0}) async {
    if (featurePageNumber == 0) {
      emit(FeaturedBookLoading());
    } else {
      emit(FeaturedBookPaginationLoading());
    }
    var result = await featureBookUseCase.call(featurePageNumber);
    return result.fold((failure) {
      if (featurePageNumber == 0) {
        emit(FeaturedBookFailure(failure.message));
      } else {
        emit(FeaturedBookPaginationFailure(failure.message));
      }
    }, (success) {
      emit(FeaturedBookSuccess(success));
    });
  }
}
