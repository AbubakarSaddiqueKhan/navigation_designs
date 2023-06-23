import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_animated_navigation/main.dart';
import 'package:flutter_animated_navigation/second_page.dart';
import 'package:flutter_animated_navigation/third.dart';

enum SlideTransitionType {
  leftIn,
  RightIn,
  TopIn,
  BottomIn,
  topLeftIn,
  topRightIn,
  bottomLeftIn,
  BottomRightIn
}

final tweenSlideTransitionMap = <SlideTransitionType, Tween<Offset>>{
  SlideTransitionType.leftIn:
      Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero),
  SlideTransitionType.RightIn:
      Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero),
  SlideTransitionType.TopIn:
      Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero),
  SlideTransitionType.BottomIn:
      Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero),
  SlideTransitionType.topLeftIn:
      Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero),
  SlideTransitionType.topRightIn: Tween<Offset>(
      begin: const Offset(
        1,
        -1,
      ),
      end: Offset.zero),
  SlideTransitionType.bottomLeftIn:
      Tween<Offset>(begin: const Offset(-1, 1), end: Offset.zero),
  SlideTransitionType.BottomRightIn:
      Tween<Offset>(begin: const Offset(1, 1), end: Offset.zero)
};

class SlideTransitionPage extends PageRouteBuilder {
  SlideTransitionPage(
      {required this.child,
      required SlideTransitionType slideTransitionType,
      RouteSettings? routeSettings,
      Duration duration = const Duration(seconds: 1)})
      : super(
            settings: routeSettings,
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: duration,
            reverseTransitionDuration: duration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              Tween<Offset>? currentTween;
              currentTween = tweenSlideTransitionMap[slideTransitionType];
              return SlideTransition(
                position: animation.drive(currentTween!),
                child: child,
              );
            });
  final Widget child;
}

Route<dynamic>? onGenerateSlideRoute(RouteSettings settings) {
  if (settings.name == MyHomePage.pageName) {
    return SlideTransitionPage(
        child: MyHomePage(title: "Home Page"),
        slideTransitionType: SlideTransitionType.TopIn,
        routeSettings: settings);
  } else if (settings.name == SecondPage.pageName) {
    return SlideTransitionPage(
        child: SecondPage(),
        slideTransitionType: SlideTransitionType.topLeftIn,
        routeSettings: settings);
  } else if (settings.name == ThirdPage.pageName) {
    return SlideTransitionPage(
        child: ThirdPage(),
        slideTransitionType: SlideTransitionType.BottomRightIn,
        routeSettings: settings);
  }
}
