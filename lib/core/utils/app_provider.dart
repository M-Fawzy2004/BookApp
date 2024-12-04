import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/functions/setup_service.dart';
import 'package:booklyapp/features/home/data/repos/home_repo_imp.dart';
import 'package:booklyapp/features/home/domain/use_case/fetch_feature_book_use_case.dart';
import 'package:booklyapp/features/home/domain/use_case/fetch_newset_book_use_case.dart';
import 'package:booklyapp/features/home/domain/use_case/fetch_similar_book_use_case.dart';
import 'package:booklyapp/features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/manager/newset_book_cubit/newset_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:booklyapp/theme/theme_app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({
    super.key,
    required this.themeProvider,
  });

  final ThemeAppProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit(
            FetchFeatureBookUseCase(
              locator.get<HomeRepoImp>(),
            ),
          )..fetchFeauturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBookCubit(
            FetchNewsetBookUseCase(
              locator.get<HomeRepoImp>(),
            ),
          )..fetchNewsetBook(),
        ),
        BlocProvider(
          create: (context) => SimilarBookCubit(
            FetchSimilarBookUseCase(
              locator.get<HomeRepoImp>(),
            ),
          )..fetchSimilarBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.themeData,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
