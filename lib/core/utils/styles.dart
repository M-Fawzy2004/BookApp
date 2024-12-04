import 'package:booklyapp/constant.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle titleLineLight(BuildContext context) {
    return TextStyle(
      fontSize: 17,
      fontFamily: kFontBold,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  static TextStyle titleLine2(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontFamily: kFont,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.inversePrimary,
    );
  }

  static const title = TextStyle(
    fontFamily: kFontBold,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const title1 = TextStyle(
    fontFamily: kFontBold,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const title2 = TextStyle(
    fontFamily: kFont,
    fontSize: 20,
  );

  static const title3 = TextStyle(
    fontFamily: kFont,
    fontSize: 18,
  );
}
