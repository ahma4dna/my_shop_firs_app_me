import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/constant/constant.dart';
import 'package:my_shop/featurers/product/cubit/product_cubit.dart';
import 'package:my_shop/featurers/product/view/product_home/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return SizedBox(
          width: size.width * 1,
          height: size.width * 0.95,
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
                          horizontal: 10), // مسافة بين العناصر
                      child: ProductCard(
                        productModel: context.read<ProductCubit>().isLoading
                            ? Constant.damylist[index]
                            : context.read<ProductCubit>().products[index],
                        size: size,
                      ),
                    );
                  },
                  childCount: context.read<ProductCubit>().isLoading
                      ? Constant.damylist.length
                      : context
                          .read<ProductCubit>()
                          .products
                          .length, // عدد العناصر
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
