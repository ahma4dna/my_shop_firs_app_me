import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/featurers/product/cubit/product_cubit.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HaertBotton extends StatelessWidget {
  const HaertBotton({super.key, required this.size, this.productModel});

  final Size size;
  final ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (context
            .read<ProductCubit>()
            .isLikw(productId: productModel?.productId ?? "")) {
          await context
              .read<ProductCubit>()
              .unLike(productId: productModel?.productId ?? "");
        } else {
          await context.read<ProductCubit>().postLike(
            productId: productModel?.productId ?? "",
            dataMap: {
              "for_product": productModel?.productId ?? "",
              "for_user": Supabase.instance.client.auth.currentUser!.id
            },
          );
        }
      },
      icon: context
              .read<ProductCubit>()
              .isLikw(productId: productModel?.productId ?? "")
          ? Icon(
              IconlyBold.heart,
              color: Colors.red,
              size: size.width * 0.08,
            )
          : Icon(
              IconlyLight.heart,
              color: Colors.red,
              size: size.width * 0.08,
            ),
    );
  }
}
