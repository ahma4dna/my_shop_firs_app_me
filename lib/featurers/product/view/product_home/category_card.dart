import 'package:flutter/material.dart';
import 'package:my_shop/core/compnds/text/custton_title_text.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.size,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  final Size size;
  final IconData icon;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.3,
          height: size.height * 0.13,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    icon,
                    size: size.width * 0.13,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.width * 0.01,
        ),
        CusttonTitleText(
          text: text,
          fontSize: size.width * 0.045,
        ),
      ],
    );
  }
}