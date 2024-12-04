import 'package:booklyapp/core/utils/functions/setup_service.dart';
import 'package:booklyapp/features/home/data/repos/home_repo_imp.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/features/home/domain/use_case/fetch_similar_book_use_case.dart';
import 'package:booklyapp/features/home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/book_details_view.dart';
import 'package:booklyapp/features/home/presentation/views/home_view.dart';
import 'package:booklyapp/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kSearchView = '/SearchView';
  static const kDetailsView = '/BookDetailsView';
  static var router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SimilarBookCubit(
              FetchSimilarBookUseCase(
                locator.get<HomeRepoImp>(),
              ),
            )..fetchSimilarBooks(),
            child: BookDetailsView(books: state.extra as BookEntity),
          );
        },
      ),
    ],
  );
}
