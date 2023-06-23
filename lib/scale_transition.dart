import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_animated_navigation/main.dart';
import 'package:flutter_animated_navigation/second_page.dart';
import 'package:flutter_animated_navigation/third.dart';

enum ScaleTransitionTypes {
  ScaleFromZero,
  ScaleFromOneForth,
  ScaleFromHalf,
  ScaleFromThreeQuarters
}

final ScaleTransitionTweenMap = <ScaleTransitionTypes, Tween<double>>{
  ScaleTransitionTypes.ScaleFromZero: Tween<double>(begin: 0.0, end: 1.0),
  ScaleTransitionTypes.ScaleFromOneForth: Tween<double>(begin: 0.25, end: 1.0),
  ScaleTransitionTypes.ScaleFromHalf: Tween<double>(begin: 0.5, end: 1.0),
  ScaleTransitionTypes.ScaleFromThreeQuarters:
      Tween<double>(begin: 0.75, end: 1.0)
};

class ScaleTransitionPage extends PageRouteBuilder {
  ScaleTransitionPage(
      {required this.child,
      required ScaleTransitionTypes scaleTransitionType,
      RouteSettings? routeSettings,
      Duration duration = const Duration(seconds: 1)})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: duration,
            settings: routeSettings,
            reverseTransitionDuration: duration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              Tween<double>? currentTween;
              currentTween = ScaleTransitionTweenMap[scaleTransitionType];
              return ScaleTransition(
                  scale: animation.drive(currentTween!), child: child);
            });
  final Widget child;
}

Route<dynamic>? onGenerateScaleRoute(RouteSettings routeSetting) {
  if (routeSetting.name == MyHomePage.pageName) {
    return ScaleTransitionPage(
        child: MyHomePage(title: "Home Page"),
        scaleTransitionType: ScaleTransitionTypes.ScaleFromOneForth,
        routeSettings: routeSetting);
  } else if (routeSetting.name == SecondPage.pageName) {
    return ScaleTransitionPage(
        child: SecondPage(),
        scaleTransitionType: ScaleTransitionTypes.ScaleFromOneForth,
        routeSettings: routeSetting);
  } else if (routeSetting.name == ThirdPage.pageName) {
    return ScaleTransitionPage(
        child: ThirdPage(),
        scaleTransitionType: ScaleTransitionTypes.ScaleFromHalf,
        routeSettings: routeSetting);
  }
}
