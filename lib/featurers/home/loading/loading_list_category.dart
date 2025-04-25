import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shop/featurers/home/loading/loading_iteam_category.dart';

class LoadingListCategory extends StatelessWidget {
  const LoadingListCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.3.sw,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 8),
          child: LoadingIteamCategory(),
        ),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}