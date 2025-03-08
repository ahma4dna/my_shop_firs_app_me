import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HaertBotton extends StatelessWidget {
  const HaertBotton({super.key, this.onPressed, required this.size});
  final void Function()? onPressed;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        IconlyLight.heart,
        color: Colors.red,
        size: size.width * 0.08,
      ),
    );
  }
}
