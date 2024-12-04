import 'package:booklyapp/core/utils/app_hive.dart';
import 'package:booklyapp/core/utils/app_provider.dart';
import 'package:booklyapp/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'theme/theme_app_provider.dart';

void main() async {
  await AppHive();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeAppProvider(),
      child: const BooklyApp(),
    ),
  );
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeAppProvider>(context);
    return AppProvider(themeProvider: themeProvider);
  }
}
