import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animated_navigation/main.dart';
import 'package:flutter_animated_navigation/second_page.dart';
import 'package:flutter_animated_navigation/third.dart';

enum RotatedTransitionTypes {
  ZeroRotation,
  RotateOneQuadrant,
  RotateTwoQuadrant,
  RotateThreeQuadrant,
  RotateOneCompleteRotation,
  RotateTwoCompleteRotations,
  RotateThreeCompleteRotations,
  RotateFourCompleteRotations,
  RotateFiveCompleteRotations
}

final RotatedTransitionTweenMap = <RotatedTransitionTypes, Tween<double>>{
  //  Don't use incomplete rotations
  // Always gives rotations in int value
  RotatedTransitionTypes.ZeroRotation: Tween<double>(begin: 0.0, end: 0.0),
  RotatedTransitionTypes.RotateOneQuadrant:
      Tween<double>(begin: 0.0, end: 0.25),
  RotatedTransitionTypes.RotateTwoQuadrant: Tween<double>(begin: 0.0, end: 0.5),
  RotatedTransitionTypes.RotateThreeQuadrant:
      Tween<double>(begin: 0, end: 0.75),

  //  Use Complete Rotations
  //  Tween must be end on the complete int value no
  //  The no of turns depend upon the int value of the no of rotations
  RotatedTransitionTypes.RotateOneCompleteRotation:
      Tween<double>(begin: 0, end: 1),
  RotatedTransitionTypes.RotateTwoCompleteRotations:
      Tween<double>(begin: 0, end: 2),
  RotatedTransitionTypes.RotateThreeCompleteRotations:
      Tween<double>(begin: 0, end: 3),
  RotatedTransitionTypes.RotateFourCompleteRotations:
      Tween<double>(begin: 0, end: 4),
  RotatedTransitionTypes.RotateFiveCompleteRotations:
      Tween<double>(begin: 0, end: 5),
};

class RotatedTransitionPage extends PageRouteBuilder {
  RotatedTransitionPage(
      {required this.child,
      RouteSettings? routeSettings,
      required RotatedTransitionTypes? rotatedTransitionTypes,
      Duration duration = const Duration(seconds: 2)})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            reverseTransitionDuration: duration,
            settings: routeSettings,
            transitionDuration: duration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              Tween<double>? currentTween;
              currentTween = RotatedTransitionTweenMap[rotatedTransitionTypes];
              return RotationTransition(
                turns: animation.drive(currentTween!),
                child: child,
              );
            });
  final Widget child;
}

Route<dynamic>? onGenerateRotatedRoute(RouteSettings routeSettings) {
  if (routeSettings.name == MyHomePage.pageName) {
    return RotatedTransitionPage(
        routeSettings: routeSettings,
        child: MyHomePage(title: "Home Page"),
        rotatedTransitionTypes: RotatedTransitionTypes.ZeroRotation);
  }
  if (routeSettings.name == SecondPage.pageName) {
    return RotatedTransitionPage(
        routeSettings: routeSettings,
        child: SecondPage(),
        rotatedTransitionTypes:
            RotatedTransitionTypes.RotateOneCompleteRotation);
  }
  if (routeSettings.name == ThirdPage.pageName) {
    return RotatedTransitionPage(
        routeSettings: routeSettings,
        child: ThirdPage(),
        rotatedTransitionTypes:
            RotatedTransitionTypes.RotateTwoCompleteRotations);
  }
}
