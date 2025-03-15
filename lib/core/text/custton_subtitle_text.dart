import 'package:flutter/material.dart';
import 'package:my_shop/constant/appe_color.dart';

class CusttonSubtitleText extends StatelessWidget {
  const CusttonSubtitleText({
    super.key,
    required this.text,
    this.color,
    this.fontSize = 15,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w600,
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
