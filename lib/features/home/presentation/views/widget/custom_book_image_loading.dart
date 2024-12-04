import 'package:flutter/material.dart';

class CustomBookImageLoading extends StatelessWidget {
  const CustomBookImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
