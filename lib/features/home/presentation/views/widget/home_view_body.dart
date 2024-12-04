import 'package:auto_size_text/auto_size_text.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/manager/newset_book_cubit/newset_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widget/custom_app_bar.dart';
import 'package:booklyapp/features/home/presentation/views/widget/scroll_animation_image_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'best_seller_list_view_builder.dart';
import 'custom_top_floating_icon.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _handleRefresh() async {
    await BlocProvider.of<FeaturedBookCubit>(context).fetchFeauturedBooks();
    await BlocProvider.of<NewsetBookCubit>(context).fetchNewsetBook();
    return await Future.delayed(
      const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          LiquidPullToRefresh(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            animSpeedFactor: 2.0,
            showChildOpacityTransition: F,
            onRefresh: _handleRefresh,
            child: CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppBar(),
                      const ScrollAnimationImageListView(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: AutoSizeText(
                          'Best Seller',
                          style: Styles.titleLine2(context),
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: BestSellerListViewBuilder(),
                ),
              ],
            ),
          ),
          CustomTopFloatingIcon(onPressed: _scrollToTop),
        ],
      ),
    );
  }
}
