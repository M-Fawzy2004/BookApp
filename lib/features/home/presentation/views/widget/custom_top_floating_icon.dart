import 'package:flutter/material.dart';

class CustomTopFloatingIcon extends StatelessWidget {
  const CustomTopFloatingIcon({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).colorScheme.surface,
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_upward,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: Text(
            'Top',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
