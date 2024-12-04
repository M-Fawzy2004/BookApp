import 'package:flutter/material.dart';

SnackBar buildSnakBarError() {
  return SnackBar(
    content: const Text(
      'BookEnded',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
