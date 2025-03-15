import 'package:flutter/material.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/view/haert_botton.dart';
import 'package:my_shop/featurers/product/view/product_detiels.dart';

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
              ));
        },
        child: SizedBox(
          width: size.width * 0.65,
          height: size.width * 0.7,
          child: Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: Image.network(
                      productModel.listUrlImage![0] ??
                          "https://storage.store.arriadagroup.com/images/products/4660/images/8b290af9010608bb458a1babb5018259.webp",
                      width: double.infinity,
                      height: size.width * 0.5, // تقليل الارتفاع لتجنب overflow
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: size.width * 0.02),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Column(
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
                    height:
                        size.width * 0.02), // إضافة مسافة صغيرة لتجنب الازدحام
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: size.width * 0.03),
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
                            size: size,
                            onPressed: () {},
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
