import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';
import 'package:localization/localization.dart';
import 'onboard_controller.dart';

class OnboardPage extends StatefulWidget {
  final String title;
  const OnboardPage({Key key, this.title = "Onboard"}) : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends ModularState<OnboardPage, OnboardController> {
  //use 'controller' variable to access controller

  final pages = [
    SkOnboardingModel(
        title: 'text-onboard-title1'.i18n(),
        description: 'text-onboard-description1'.i18n(),
        titleColor: Colors.white,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboard_movie_friends.png'),
    SkOnboardingModel(
        title: 'text-onboard-title2'.i18n(),
        description: 'text-onboard-description2'.i18n(),
        titleColor: Colors.white,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboard_evaluation.png'),
    SkOnboardingModel(
        title: 'text-onboard-title3'.i18n(),
        description: 'text-onboard-description3'.i18n(),
        titleColor: Colors.white,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboard_share_friends.png'),
    SkOnboardingModel(
        title: 'text-onboard-title4'.i18n(),
        description: '',
        titleColor: Colors.white,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboard_watch.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SKOnboardingScreen(
        bgColor: Colors.black,
        themeColor: const Color(0xFFA20409),
        pages: pages,
        textSkipClicked: 'button-skip'.i18n(),
        textGetStartedClicked: 'button-start'.i18n(),
        skipClicked: (value) {
          print("Pular");
          Modular.to.pushReplacementNamed("/login");
        },
        getStartedClicked: (value) {
          print("Iniciar");
          Modular.to.pushReplacementNamed("/login");
        },
      ),
    );
  }
}
