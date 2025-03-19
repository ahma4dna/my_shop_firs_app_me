import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/featurers/cart/cubit/cart_cubit.dart';
import 'package:my_shop/featurers/cart/model/cart_model/cart_model.dart';
import 'package:my_shop/featurers/cart/view/quantity_selector.dart';
import 'package:my_shop/featurers/product/view/product_detelis/product_detiels.dart';

class CartWidget extends StatelessWidget {
  final double width;
  final CartModel cartModel;
  final int index;
  const CartWidget({
    super.key,
    required this.width,
    required this.cartModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();

    return SizedBox(
      width: width * 0.95,
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
                      cartModel.products?.listUrlImage?[0] ??
                          "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1822937191671cc8a91ab218.05490775___8b290af9010608bb458a1babb5018259.webp",
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.05),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CusttonSubtitleText(
                        text: cartModel.products?.productTitle ??
                            "iPhone 16 Pro Max",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: width * 0.05),
                      QuantitySelector(
                        cartModel: cartModel,
                        quantity: cartModel.quantiti ?? 1,
                        withe: width,
                        index: index, // تمرير index إلى QuantitySelector
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
                      onPressed: () async {
                        await cubit.removeCards(data: {
                          "id": cartModel.id,
                        }, prodctId: cartModel.forProduct!);
                        await cubit.getCards();
                      },
                      icon: Icon(IconlyLight.delete),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CusttonSubtitleText(
                        text: "${cartModel.products?.price} دل" ?? "7000 دل",
                        color: Theme.of(context).iconTheme.color,
                        fontSize: width * 0.05,
                      ),
                    ),
                    SizedBox(height: width * 0.04),
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
