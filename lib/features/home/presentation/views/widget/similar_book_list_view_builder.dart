import 'package:booklyapp/core/utils/functions/build_error_snak_bar.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widget/similar_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListViewBuilder extends StatefulWidget {
  const SimilarBookListViewBuilder({super.key});

  @override
  State<SimilarBookListViewBuilder> createState() =>
      _SimilarBookListViewBuilderState();
}

class _SimilarBookListViewBuilderState
    extends State<SimilarBookListViewBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBookCubit, SimilarBookState>(
      listener: (context, state) {
        if (state is SimilarBookSuccess) {
          setState(() {
            books = List.from(state.book);
            books.shuffle();
          });
        }

        if (state is SimilarBookPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(),
          );
        }
      },
      builder: (context, state) {
        if (state is SimilarBookSuccess ||
            state is SimilarBookPaginationLoading ||
            state is SimilarBookPaginationFailure) {
          return SimilarBookListView(books: books);
        } else if (state is SimilarBookFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is SimilarBookLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: const Center(child: Text('No Image')),
          );
        }
      },
    );
  }
}
