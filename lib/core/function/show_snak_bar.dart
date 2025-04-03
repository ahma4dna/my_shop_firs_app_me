import 'package:flutter/material.dart';
import 'package:my_shop/core/compnds/text/custton_title_text.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnakBar(
    BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CusttonTitleText(text: text, maxLines: 3, color: Colors.white),
      // ignore: deprecated_member_use
      backgroundColor: Colors.grey.withOpacity(0.8),
    ),
  );
}
