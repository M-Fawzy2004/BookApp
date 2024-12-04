// ignore_for_file: use_build_context_synchronously

import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/features/splash/presentation/views/widget/logo_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LogoAnimation(
            animationController: animationController,
            slidingAnimation: slidingAnimation,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.009,
          ),
          SlidingText(
            animationController: animationController,
            slidingAnimation: slidingAnimation,
          ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 15), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        // Get.to(
        //   const HomeView(),
        //   transition: Transition.circularReveal,
        //   duration: const Duration(milliseconds: 10),
        // );
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
