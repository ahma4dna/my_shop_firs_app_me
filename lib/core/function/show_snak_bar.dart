
import 'package:flutter/material.dart';
import 'package:my_shop/core/text/custton_title_text.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnakBar(
    BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      
      content: CusttonTitleText(
        text: text,
        maxLines: 3,
        color: Colors.white
      ),
      backgroundColor: Colors.grey.withOpacity(0.8),
    ),
  );
}
