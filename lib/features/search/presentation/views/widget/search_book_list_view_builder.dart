import 'package:booklyapp/features/search/manager/search_book_cubit/search_books_cubit.dart';
import 'package:booklyapp/features/search/presentation/views/widget/search_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksListViewBuilder extends StatelessWidget {
  const SearchBooksListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBookSuccess) {
          return SearchBooksListView(books: state.book);
        } else if (state is SearchBookFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
