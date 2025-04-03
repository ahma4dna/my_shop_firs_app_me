import 'package:flutter/material.dart';
import 'package:my_shop/constant/appe_color.dart';

class CustonTextButton extends StatelessWidget {
  const CustonTextButton({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.color = AppColors.kPrimaryColor,
    required this.function,
  });
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
