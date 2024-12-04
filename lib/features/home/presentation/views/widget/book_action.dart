import 'package:booklyapp/core/utils/web_view_screen.dart';
import 'package:booklyapp/core/widget/custom_button.dart';
import 'package:booklyapp/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {},
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              backgroundColor: Colors.white,
              text: 'Free',
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(url: bookEntity.url),
                  ),
                );
              },
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              backgroundColor: const Color(0xffEF8262),
              text: 'Free preview',
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
