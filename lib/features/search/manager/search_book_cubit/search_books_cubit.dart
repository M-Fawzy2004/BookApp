import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/domain/use_case/fetch_search_book_use_case.dart';
import 'package:meta/meta.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.fetchSearchBookUseCase) : super(SearchBookInitial());

  final FetchSearchBookUseCase fetchSearchBookUseCase;

  Future<void> fetchSearchBooks() async {
    emit(SearchBookLoading());
    var result = await fetchSearchBookUseCase.call();
    return result.fold((failure) {
      emit(SearchBookFailure(failure.message));
    }, (success) {
      emit(SearchBookSuccess(success));
    });
  }
}
