// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:flutter_animated_navigation/main.dart';
// import 'package:flutter_animated_navigation/second_page.dart';
// import 'package:flutter_animated_navigation/third.dart';

// enum SizeTransitionTypes { OneForthSize, HalfSize, ThirdSize, FullSize }

// final sizeTransitionMap = <SizeTransitionTypes, Tween<double>>{
//   SizeTransitionTypes.OneForthSize: Tween(begin: 0, end: 25),
//   SizeTransitionTypes.HalfSize: Tween(begin: 0, end: 50),
//   SizeTransitionTypes.ThirdSize: Tween(begin: 0, end: 75),
//   SizeTransitionTypes.FullSize: Tween(begin: 0, end: 100),
// };

// class SizeTransitionPage extends PageRouteBuilder {
//   SizeTransitionPage(
//       {required this.child,
//       required SizeTransitionTypes sizeTransitionTypes,
//       Duration duration = const Duration(seconds: 5),
//       RouteSettings? routeSettings})
//       : super(
//             pageBuilder: (context, animation, secondaryAnimation) => child,
//             reverseTransitionDuration: duration,
//             settings: routeSettings,
//             transitionDuration: duration,
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               final currentTween;
//               currentTween = sizeTransitionMap[sizeTransitionTypes];
//               return SizeTransition(
//                 sizeFactor: animation.drive(currentTween!),
//                 // axis: Axis.horizontal,
//                 // axisAlignment: -1.0,
//                 child: child,
//               );
//             });
//   final Widget child;
// }

// Route<dynamic>? onGenerateSizeRoute(RouteSettings routeSettings) {
//   if (routeSettings.name == MyHomePage.pageName) {
//     return SizeTransitionPage(
//         child: MyHomePage(title: "Home Page"),
//         sizeTransitionTypes: SizeTransitionTypes.FullSize,
//         routeSettings: routeSettings);
//   } else if (routeSettings.name == SecondPage.pageName) {
//     return SizeTransitionPage(
//         child: SecondPage(),
//         sizeTransitionTypes: SizeTransitionTypes.OneForthSize,
//         routeSettings: routeSettings);
//   } else if (routeSettings.name == ThirdPage.pageName) {
//     return SizeTransitionPage(
//         child: ThirdPage(),
//         sizeTransitionTypes: SizeTransitionTypes.ThirdSize,
//         routeSettings: routeSettings);
//   }
// }
