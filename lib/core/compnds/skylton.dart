import 'package:flutter/material.dart';

class Skylton extends StatelessWidget {
  const Skylton({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: width,
      height: height,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Theme.of(context).dialogBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}