import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/features/search/presentation/views/widget/search_list_view_builder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final ApiService apiService = ApiService(Dio());

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 18,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(
          'Please enter a search term',
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      );
    } else {
      return SearchFutureBuilder();
    }
  }

  // ignore: non_constant_identifier_names
  FutureBuilder<Map<String, dynamic>> SearchFutureBuilder() {
    return FutureBuilder(
      future: apiService.get(
        endPoint: 'volumes?q=$query&filter=free-ebooks',
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData ||
            (snapshot.data as Map)['items'] == null) {
          return Center(
            child: Text(
              'No books found',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        } else {
          final data = snapshot.data as Map<String, dynamic>;
          final books = data['items'] as List;

          return SearchListViewBuilder(books);
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Center(
            child: Text(
              'Search for books...',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        : buildResults(context);
  }
}
