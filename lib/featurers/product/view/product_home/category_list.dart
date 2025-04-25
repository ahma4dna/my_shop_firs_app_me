import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/constant/constant.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/featurers/product/view/product_home/category_card.dart';
import 'package:my_shop/featurers/search/cubit/search_cubit.dart';
import 'package:my_shop/featurers/search/view/search_view.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 1,
      height: size.height * 0.2,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () async {
              context
                  .read<SearchCubit>()
                  .selectCategoryHome(CategoryMosel.categryModel[index].text);
              navigationTo(
                context: context,
                page: SearchView(
                    // caegory: CategoryMosel.categryModel[index].text,
                    ),
              );
            },
            child: CategoryCard(
              size: size,
              icon: CategoryMosel.categryModel[index].icon,
              text: CategoryMosel.categryModel[index].text,
            ),
          ),
        ),
        itemCount: CategoryMosel.caeoryText.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
