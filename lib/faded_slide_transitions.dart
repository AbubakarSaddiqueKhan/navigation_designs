import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_animated_navigation/faded_scale_transition.dart';
import 'package:flutter_animated_navigation/main.dart';
import 'package:flutter_animated_navigation/second_page.dart';
import 'package:flutter_animated_navigation/third.dart';

enum FadedSlideTransitions {
  FadeIn,
  leftIn,
  RightIn,
  TopIn,
  BottomIn,
  topLeftIn,
  topRightIn,
  bottomLeftIn,
  BottomRightIn
}

final fadedSlideTransitionMap = <FadedSlideTransitions, Tween<dynamic>>{
  FadedSlideTransitions.FadeIn: Tween<double>(begin: 0.0, end: 1.0),
  FadedSlideTransitions.leftIn:
      Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero),
  FadedSlideTransitions.RightIn:
      Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero),
  FadedSlideTransitions.TopIn:
      Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero),
  FadedSlideTransitions.BottomIn:
      Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero),
  FadedSlideTransitions.topLeftIn:
      Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero),
  FadedSlideTransitions.topRightIn: Tween<Offset>(
      begin: const Offset(
        1,
        -1,
      ),
      end: Offset.zero),
  FadedSlideTransitions.bottomLeftIn:
      Tween<Offset>(begin: const Offset(-1, 1), end: Offset.zero),
  FadedSlideTransitions.BottomRightIn:
      Tween<Offset>(begin: const Offset(1, 1), end: Offset.zero)
};

class FadedSlideTransitionPage extends PageRouteBuilder {
  FadedSlideTransitionPage(
      {required this.child,
      required FadedSlideTransitions fadedSlideTransitions,
      Duration duration = const Duration(seconds: 2),
      RouteSettings? routeSettings})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            reverseTransitionDuration: duration,
            settings: routeSettings,
            transitionDuration: duration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final fadeTweenvalue;
              fadeTweenvalue =
                  fadedSlideTransitionMap[FadedSlideTransitions.FadeIn];

              final currentTween;
              currentTween = fadedSlideTransitionMap[fadedSlideTransitions];
              return SlideTransition(
                position: animation.drive(currentTween!),
                child: FadeTransition(
                  opacity: animation.drive(fadeTweenvalue),
                  child: child,
                ),
              );
            });
  final Widget child;
}

Route<dynamic>? onGenerateFadedSlidedRoute(RouteSettings routeSettings) {
  if (routeSettings.name == MyHomePage.pageName) {
    return FadedSlideTransitionPage(
        child: MyHomePage(title: "Home Page"),
        fadedSlideTransitions: FadedSlideTransitions.leftIn,
        routeSettings: routeSettings);
  } else if (routeSettings.name == SecondPage.pageName) {
    return FadedSlideTransitionPage(
        child: SecondPage(),
        fadedSlideTransitions: FadedSlideTransitions.topLeftIn,
        routeSettings: routeSettings);
  } else if (routeSettings.name == ThirdPage.pageName) {
    return FadedSlideTransitionPage(
        child: ThirdPage(),
        fadedSlideTransitions: FadedSlideTransitions.BottomRightIn,
        routeSettings: routeSettings);
  }
}
