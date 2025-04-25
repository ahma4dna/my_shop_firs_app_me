import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shop/featurers/home/loading/loading_product_home_iteam.dart';

class LoadingListProduct extends StatelessWidget {
  const LoadingListProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.6.sw,
      child: CustomScrollView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.023.sw,
                  ), // مسافة بين العناصر
                  child: LoadingProductHomeIteam(),
                );
              },
              childCount: 5, // عدد العناصر
            ),
          ),
        ],
      ),
    );
  }
}
