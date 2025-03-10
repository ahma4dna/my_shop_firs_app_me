import 'package:flutter/material.dart';

Future<dynamic> navigationTo(
    {required BuildContext context, required Widget page}) {
  return Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var slideIn = Tween(begin: Offset(-1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut));

        var slideOut = Tween(begin: Offset.zero, end: Offset(1.0, 0.0))
            .chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(
          position: animation.drive(slideIn),
          child: SlideTransition(
            position: secondaryAnimation.drive(slideOut),
            child: child,
          ),
        );
      },
    ),
  );
}
