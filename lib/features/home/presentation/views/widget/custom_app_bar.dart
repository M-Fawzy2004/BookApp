// ignore_for_file: deprecated_member_use

import 'package:booklyapp/core/utils/app_image.dart';
import 'package:booklyapp/features/search/presentation/views/widget/search_book_app.dart';
import 'package:booklyapp/theme/theme_app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // image logo
          SvgPicture.asset(
            Assets.imageBOOKLY,
            height: MediaQuery.of(context).size.height * 0.022,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.19,
          ),
          // icon brightness
          IconButton(
            onPressed: () {
              Provider.of<ThemeAppProvider>(context, listen: false)
                  .toggleTheme();
            },
            icon: Icon(
              CupertinoIcons.brightness,
              size: MediaQuery.of(context).size.height * 0.03,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const Spacer(),
          // icon search
          IconButton(
            onPressed: () {
              // GoRouter.of(context).push(AppRouter.kSearchView);
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: MediaQuery.of(context).size.height * 0.025,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
