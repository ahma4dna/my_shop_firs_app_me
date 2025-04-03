import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/compnds/text/custton_title_text.dart';
import 'package:my_shop/featurers/cart/cubit/cart_cubit.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';

class BottonSeatDetils extends StatelessWidget {
  const BottonSeatDetils({
    super.key,
    required this.size,
    this.onPressed,
    this.productModel,
    required this.state,
    this.onPressed2,
  });
  final ProductModel? productModel;
  final Size size;
  final void Function()? onPressed;
  final void Function()? onPressed2;
  final CartState state;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        // final bool existsInCart = productModel != null &&
        //     cubit.isInCart(productId: productModel!.productId ?? "");
        return ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0),
          ),
          child: Container(
            color: Theme.of(context).cardTheme.color,
            width: double.infinity,
            height: size.width * 0.24,
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 5),
                    child:
                        cubit.isInCartqe(productId: productModel!.productId ?? "")
                            ? SizedBox(
                                width: size.width * 0.7,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                  side: BorderSide(width: 2,color: Theme.of(context).primaryColor),
                                    shape: RoundedRectangleBorder(
                                  
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: onPressed2,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: size.width * 0.13,
                                    ),
                                    child: FittedBox(
                                      child: CusttonTitleText(
                                        text: "انتقل الى السله",
                                        color: Theme.of(context).primaryColor,
                                        fontSize: size.width * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: onPressed,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: size.width * 0.13,
                                  ),
                                  child: FittedBox(
                                    child: CusttonTitleText(
                                      text: "إضافة الى السلة",
                                      color: Theme.of(context).iconTheme.color,
                                      fontSize: size.width * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                FittedBox(
                  child: CusttonTitleText(
                    text: " دل",
                    fontSize: size.width * 0.05,
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    child: CusttonTitleText(
                      text: productModel!.price ?? "0000",
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
