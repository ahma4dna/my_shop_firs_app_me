import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/featurers/cart/cubit/cart_cubit.dart';
import 'package:my_shop/featurers/cart/view/cart_widget.dart';
import 'package:my_shop/featurers/cart/view/cheak_botton_sheat.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  Future<void> getCards() async {
    Future.wait({
      context.read<CartCubit>().getCards(),
    });
  
  }

  @override
  void initState() {
    getCards();
    context.read<CartCubit>().totalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<CartCubit>();

        return state is GetCardsLoading
            ? Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ))
            : Scaffold(
                bottomSheet: CheakBottonSheat(width: width),
                appBar: AppBar(
                  centerTitle: true,
                  title: CusttonSubtitleText(
                    text: "السله",
                    fontSize: width * 0.065,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () async {
                        await cubit.removeAllCards();
                        await cubit.getCards();
                      },
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
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: CartWidget(
                                  width: width,
                                  cartModel: context
                                      .read<CartCubit>()
                                      .cardPurchases[index],
                                  index: index, // تمرير index لكل عنصر
                                ),
                              );
                            },
                            childCount:
                                context.read<CartCubit>().cardPurchases.length,
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
    );
  }
}
