import 'package:flutter/material.dart';
import 'package:my_shop/featurers/product/view/product_card.dart';

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
      height: size.height * 0.38,
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
                    size: size,
                    width: size.width * 0.6,
                    height: size.height * 0.38,
                  ),
                );
              },
              childCount: 10, // عدد العناصر
            ),
          ),
        ],
      ),
    );
  }
}
