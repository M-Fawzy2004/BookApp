import 'package:booklyapp/core/utils/functions/build_error_snak_bar.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/presentation/manager/newset_book_cubit/newset_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view.dart';

class BestSellerListViewBuilder extends StatefulWidget {
  const BestSellerListViewBuilder({super.key});

  @override
  State<BestSellerListViewBuilder> createState() =>
      _BestSellerListViewBuilderState();
}

class _BestSellerListViewBuilderState extends State<BestSellerListViewBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsetBookCubit, NewsetBookState>(
      listener: (context, state) {
        if (state is NewsetBookSuccess) {
          setState(() {
            books = List.from(state.books);
            books.shuffle();
          });
        }

        if (state is NewsetBookPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(),
          );
        }
      },
      builder: (context, state) {
        if (state is NewsetBookSuccess ||
            state is NewsetBookPaginationLoading ||
            state is NewsetBookPaginationFailure) {
          return BestSellerListView(
            books: books,
          );
        } else if (state is NewsetBookFailure) {
          return Text(state.message);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
