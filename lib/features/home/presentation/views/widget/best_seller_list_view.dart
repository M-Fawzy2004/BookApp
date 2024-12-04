import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/presentation/manager/newset_book_cubit/newset_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widget/book_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  late final ScrollController _scrollController;
  bool isLoading = false;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      var currentPoistion = _scrollController.position.pixels;
      var maxPoistions = _scrollController.position.maxScrollExtent;
      if (currentPoistion >= 0.7 * maxPoistions) {
        if (!isLoading) {
          isLoading = true;
          BlocProvider.of<NewsetBookCubit>(context)
              .fetchNewsetBook(newsetPageNumber: nextPage++);
          isLoading = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return BookListItem(
          books: widget.books[index],
        );
      },
    );
  }
}
