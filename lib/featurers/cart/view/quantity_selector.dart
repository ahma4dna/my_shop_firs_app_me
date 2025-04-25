import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/featurers/cart/cubit/cart_cubit.dart';
import 'package:my_shop/featurers/cart/model/cart_model/cart_model.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final double withe;
  final CartModel cartModel;
  final int index;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.withe,
    required this.cartModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();

    return Container(
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
                size: withe * 0.05,
              ),
              onPressed: () async {
                cubit.addQuantity(index);
                cubit.totalPrice();
                cubit.totalPriceOneProdct(productId: cartModel.forProduct!);
                await cubit.updateToalProctPrice(data: {
                  
                  "total_price": cartModel.totalPrice,
                }, id: cartModel.id!);
                await cubit.updateQuantity(
                  data: {"quantiti": cubit.quantity},
                  id: cartModel.id!,
                );
                // تحديث العدد حسب index
              },
            ),
          ),
          Flexible(
            child: Text(
              '$quantity',
              style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontSize: withe * 0.045,
              ),
            ),
          ),
          Flexible(
            child: IconButton(
              icon: Icon(
                quantity == 1 ? Icons.delete : Icons.remove,
                color: Theme.of(context).primaryColor,
                size: withe * 0.05,
              ),
              onPressed: () async {
                if (cubit.quantity == 1) {
                  await cubit.removeCards(
                      id: cartModel.id!,
                      data: {
                        "id": cartModel.id,
                      },
                      prodctId: cartModel.forProduct!);
                  await cubit.getCards();
                }
                cubit.removeQuantity(index);
                cubit.totalPrice();
                cubit.totalPriceOneProdct(productId: cartModel.forProduct!);
                await cubit.updateToalProctPrice(data: {
                
                  "total_price": cartModel.totalPrice,
                }, id: cartModel.id!); // تحديث العدد حسب index
                await cubit.updateQuantity(
                  data: {"quantiti": cubit.quantity},
                  id: cartModel.id!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
