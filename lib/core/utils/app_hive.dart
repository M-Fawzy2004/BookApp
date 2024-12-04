// ignore_for_file: non_constant_identifier_names, unnecessary_import

import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/utils/functions/setup_service.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> AppHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewsetBox);
  await Hive.openBox<BookEntity>(kSimilarBox);
  setupServiceLocator();
}
