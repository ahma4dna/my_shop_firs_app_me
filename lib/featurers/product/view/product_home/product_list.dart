import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/featurers/product/cubit/product_cubit.dart';
import 'package:my_shop/featurers/product/view/product_home/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 1,
      height: size.width * 1,
      child: CustomScrollView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10), // مسافة بين العناصر
                  child: ProductCard(
                    // listRiv: context.read<ProductCubit>().reviews,
                    // reviewModel:  context.read<ProductCubit>().reviews[index],
                    productModel: context.read<ProductCubit>().products[index],
                    size: size,
                  ),
                );
              },
              childCount: context.read<ProductCubit>().products.length ??
                  2, // عدد العناصر
            ),
          ),
        ],
      ),
    );
  }
}
