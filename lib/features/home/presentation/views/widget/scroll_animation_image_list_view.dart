import 'package:booklyapp/core/utils/functions/build_error_snak_bar.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widget/scroll_animation_image.dart';
import 'package:booklyapp/features/home/presentation/views/widget/scroll_animation_list_view_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollAnimationImageListView extends StatefulWidget {
  const ScrollAnimationImageListView({super.key});

  @override
  State<ScrollAnimationImageListView> createState() =>
      _ScrollAnimationImageListViewState();
}

class _ScrollAnimationImageListViewState
    extends State<ScrollAnimationImageListView> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookSuccess) {
          books.addAll(state.books);
          books.shuffle();
        }

        if (state is FeaturedBookPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookSuccess ||
            state is FeaturedBookPaginationLoading ||
            state is FeaturedBookPaginationFailure) {
          return ScrollAnimationImage(
            books: books,
          );
        } else if (state is FeaturedBookFailure) {
          return Text(state.errMessage);
        } else {
          return const ScrollAnimationListViewLoading();
        }
      },
    );
  }
}
