import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_animated_navigation/main.dart';
import 'package:flutter_animated_navigation/second_page.dart';
import 'package:flutter_animated_navigation/third.dart';

enum FadedScaleTypes { scaleFromZero, FadeIn }

final FadedScaleMap = <FadedScaleTypes, Tween<double>>{
  FadedScaleTypes.scaleFromZero: Tween<double>(begin: 0.0, end: 1.0),
  FadedScaleTypes.FadeIn: Tween<double>(begin: 0.0, end: 1.0)
};

class FadedScaleTransitionPage extends PageRouteBuilder {
  FadedScaleTransitionPage(
      {required this.child,
      required FadedScaleTypes fadedScaleTypes,
      Duration duration = const Duration(seconds: 1),
      RouteSettings? routeSettings})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            reverseTransitionDuration: duration,
            settings: routeSettings,
            transitionDuration: duration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final currentTween;
              currentTween = FadedScaleMap[fadedScaleTypes];
              return FadeTransition(
                opacity: animation.drive(currentTween!),
                child: ScaleTransition(
                  scale: animation.drive(currentTween!),
                  child: child,
                ),
              );
            });
  final Widget child;
}

Route<dynamic>? onGenerateFadedScaleRoute(RouteSettings routeSettings) {
  if (routeSettings.name == MyHomePage.pageName) {
    return FadedScaleTransitionPage(
        child: MyHomePage(title: "Home Page"),
        fadedScaleTypes: FadedScaleTypes.FadeIn,
        routeSettings: routeSettings);
  } else if (routeSettings.name == SecondPage.pageName) {
    return FadedScaleTransitionPage(
        child: SecondPage(),
        fadedScaleTypes: FadedScaleTypes.FadeIn,
        routeSettings: routeSettings);
  } else if (routeSettings.name == ThirdPage.pageName) {
    return FadedScaleTransitionPage(
        child: ThirdPage(),
        fadedScaleTypes: FadedScaleTypes.scaleFromZero,
        routeSettings: routeSettings);
  }
}
