import 'package:flutter/material.dart';

Future<dynamic> navigationTo(
    {required BuildContext context, required Widget page}) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}
