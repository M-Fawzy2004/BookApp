import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'similar_book_list_view_item.dart';

class SimilarBookListView extends StatefulWidget {
  const SimilarBookListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<SimilarBookListView> createState() => _SimilarBookListViewState();
}

class _SimilarBookListViewState extends State<SimilarBookListView> {
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
          BlocProvider.of<SimilarBookCubit>(context)
              .fetchSimilarBooks(similarPageNumber: nextPage++);
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.17,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return SimilarBookListViewItem(books: widget.books[index]);
          },
        ),
      ),
    );
  }
}
