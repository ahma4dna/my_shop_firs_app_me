import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iconly/iconly.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/featurers/cart/cubit/cart_cubit.dart';
import 'package:my_shop/featurers/product/view/product_detiels.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          return Scaffold(
            bottomSheet: CheakBottonSheat(width: width),
            appBar: AppBar(
              centerTitle: true,
              title: CusttonSubtitleText(
                text: "السله",
                fontSize: width * 0.065,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(IconlyBold.delete),
                  color: Colors.red,
                ),
              ],
            ),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                CustomScrollView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5), // مسافة بين العناصر
                              child: CartWidget(width: width));
                        },
                        childCount: 10, // عدد العناصر
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: kBottomNavigationBarHeight + width * 0.1,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return SizedBox(
      width: width * 95,
      height: width * 0.37,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      navigationTo(context: context, page: ProductDetiels());
                    },
                    child: Image.network(
                      width: width * 0.3,
                      height: width * 0.37,
                      fit: BoxFit.cover,
                      "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1822937191671cc8a91ab218.05490775___8b290af9010608bb458a1babb5018259.webp",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CusttonSubtitleText(
                        text: "iPhone 16 Pro Max" * 20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: width * 0.05,
                      ),
                      QuantitySelector(
                        quantity: cubit.quantity,
                        withe: width,
                        onAdd: () {
                          cubit.addQuantitty();
                        },
                        onRemove: () {
                          if (cubit.quantity == 1) {
                            ///use function deleate one cart
                          }
                          cubit.removeQuantitty();

                          // تقليل العدد أو الحذف
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconlyLight.delete,
                      ),
                    ),
                    Spacer(),
                    CusttonSubtitleText(
                      text: " 7000 دل" * 20,
                      color: Theme.of(context).iconTheme.color,
                      fontSize: width * 0.05,
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final double withe;

  QuantitySelector({
    Key? key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.withe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                  size: withe * 0.05,
                ),
                onPressed: onAdd,
              ),
              Text(
                '$quantity',
                style: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontSize: withe * 0.045),
              ),
              IconButton(
                icon: Icon(
                  context.read<CartCubit>().quantity == 1
                      ? Icons.delete
                      : Icons.remove,
                  color: Theme.of(context).primaryColor,
                  size: withe * 0.05,
                ),
                onPressed: onRemove,
              ),
            ],
          ),
        );
      },
    );
  }
}

class CheakBottonSheat extends StatelessWidget {
  const CheakBottonSheat({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight + width * 0.06,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                width: double.infinity,
                height: width * 0.13,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: CusttonSubtitleText(
                        text: "تاكيد",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CusttonSubtitleText(
                  text: "7000 دل",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
