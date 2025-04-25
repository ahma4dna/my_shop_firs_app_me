import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/compnds/text/custton_subtitle_text.dart';
import 'package:my_shop/core/compnds/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/view/product_home/haert_botton.dart';
import 'package:my_shop/featurers/product/view/product_detelis/product_detiels.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.size,
    this.width,
    this.height,
    required this.productModel,
  });

  final Size size;
  final double? width;
  final double? height;
  final ProductModel productModel;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          navigationTo(
              context: context,
              page: ProductDetiels(
                productModel: productModel,
                // reviewModel: reviewModel,
                // listRiv: listRiv,
                
              ));
        },
        child: SizedBox(
          width: size.width * 0.65,
          child: Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    child: FancyShimmerImage(
                   imageUrl:    productModel.listUrlImage![0],
                      width: double.infinity,
                      height: size.width *
                          0.5, 
                      boxFit: BoxFit.cover,
                       shimmerBaseColor: Colors.grey[300]!,
                      shimmerHighlightColor: Colors.grey[100]!,
                      shimmerBackColor: Colors.white,
                      errorWidget: Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(height: size.width * 0.02),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: CusttonSubtitleText(
                            text: productModel.marka ?? "marka",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w300,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: CusttonTitleText(
                            text: productModel.productTitle ??
                                "iphone 16 pro Max",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            fontSize: size.width * 0.055,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: size.width *
                        0.02), // إضافة مسافة صغيرة لتجنب الازدحام
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: size.width * 0.03),
                                  child: CusttonSubtitleText(
                                    text: productModel.price ?? "7000",
                                    fontSize: size.width * 0.065,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: size.width * 0.02),
                                CusttonSubtitleText(
                                  text: "د.ل",
                                  fontWeight: FontWeight.w300,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: size.width * 0.0469,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: HaertBotton(
                            productModel: productModel,
                            size: size,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
