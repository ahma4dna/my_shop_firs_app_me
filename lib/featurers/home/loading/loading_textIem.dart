// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shop/core/compnds/skylton.dart';

class LoadingTextIem extends StatelessWidget {
  const LoadingTextIem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skylton(
          width: 0.55.sw,
          height: 0.1.sw,
        );
  }
}