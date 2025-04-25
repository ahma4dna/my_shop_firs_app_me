import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shop/core/compnds/skylton.dart';

class LoadingCarouselSlider extends StatelessWidget {
  const LoadingCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skylton(
        width: 0.9.sw,
        height: 0.4.sw,
      );
  }
}