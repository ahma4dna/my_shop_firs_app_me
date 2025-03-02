import 'package:flutter/material.dart';
import 'package:my_shop/core/text/custton_title_text.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CusttonTitleText(text: "CartView"),
    );
  }
}
