import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.borderRadius,
    required this.backgroundColor,
    required this.text,
    required this.textColor,
    this.onPressed,
  });

  final BorderRadius borderRadius;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.title.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
