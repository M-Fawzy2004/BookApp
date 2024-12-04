import 'package:auto_size_text/auto_size_text.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentation/views/widget/similar_book_list_view_builder.dart';
import 'package:flutter/material.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              'You Can Also Like',
              style: Styles.title2.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SimilarBookListViewBuilder(),
      ],
    );
  }
}
