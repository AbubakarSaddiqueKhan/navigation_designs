import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:flutter_animated_navigation/main.dart';
import 'package:flutter_animated_navigation/second_page.dart';
import 'package:flutter_animated_navigation/third.dart';

enum FadeTransitionTypes { Fadein, FadeOut }

final FadeTweenTransitionMap = <FadeTransitionTypes, Tween<double>>{
  //  Use Fade in
  FadeTransitionTypes.Fadein: Tween<double>(begin: 0, end: 1),
  // Don't use fade out with the end value zero it will blur your page
  FadeTransitionTypes.FadeOut: Tween<double>(begin: 1, end: 0.5)
};

class FadeTransitionPage extends PageRouteBuilder {
  FadeTransitionPage(
      {required this.child,
      required FadeTransitionTypes,
      RouteSettings? routeSettings,
      Duration duration = const Duration(seconds: 1)})
      : super(
            transitionDuration: duration,
            settings: routeSettings,
            reverseTransitionDuration: duration,
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              Tween<double>? currentTween;
              currentTween = FadeTweenTransitionMap[FadeTransitionTypes];
              return FadeTransition(
                  opacity: animation.drive(currentTween!), child: child);
            });
  final Widget child;
}

Route<dynamic>? onGenerateFadeRoute(RouteSettings routeSettings) {
  if (routeSettings.name == MyHomePage.pageName) {
    return FadeTransitionPage(
      child: MyHomePage(title: "Home Page"),
      FadeTransitionTypes: FadeTransitionTypes.Fadein,
      routeSettings: routeSettings,
    );
  } else if (routeSettings.name == SecondPage.pageName) {
    return FadeTransitionPage(
      child: SecondPage(),
      FadeTransitionTypes: FadeTransitionTypes.FadeOut,
      routeSettings: routeSettings,
    );
  } else if (routeSettings.name == ThirdPage.pageName) {
    return FadeTransitionPage(
      child: ThirdPage(),
      FadeTransitionTypes: FadeTransitionTypes.Fadein,
      routeSettings: routeSettings,
    );
  }
}
