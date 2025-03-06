import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HaertBotton extends StatelessWidget {
   HaertBotton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        IconlyLight.heart,
        color: Colors.red,
        size: 30,
      ),
    );
  }
}
