// ignore_for_file: deprecated_member_use

import 'package:booklyapp/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({
    super.key,
    required this.animationController,
    required this.slidingAnimation,
  });

  final AnimationController animationController;
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: SvgPicture.asset(
            Assets.imageBOOKLY,
            color: Theme.of(context).colorScheme.inversePrimary,
            width: MediaQuery.of(context).size.width * 0.7,
          ),
        );
      },
    );
  }
}
