import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/Widget_Condition_Auth/Condition_Auth_Screen.dart';
import '../../main.dart';
import '../../view/Widgets/Splash/Custom_Splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      backgroundColor: Colors.grey.shade100,
      splashIconSize: media.height,
      splash: const SplashWidget(),
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 0),
      nextScreen: const ConditionScreen(),
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}
