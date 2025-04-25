import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shop/core/compnds/skylton.dart';

class LoadingIteamCategory extends StatelessWidget {
  const LoadingIteamCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skylton(
      width: 0.38.sw,
      height: 0.35.sw,
    );
  }
}