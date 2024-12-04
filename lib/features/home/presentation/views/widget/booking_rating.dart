import 'package:auto_size_text/auto_size_text.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookingRating extends StatelessWidget {
  const BookingRating({
    super.key,
    required this.rating,
    required this.countRating,
  });

  final num rating;
  final num countRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: 18,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        AutoSizeText(
          rating.toString(),
          style: Styles.titleLine2(context).copyWith(
            fontSize: 17,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        AutoSizeText(
          '(${countRating.round().toString()})',
          style: Styles.titleLine2(context).copyWith(
            fontSize: 17,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
