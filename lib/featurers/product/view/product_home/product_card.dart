import 'package:flutter/material.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/compnds/text/custton_subtitle_text.dart';
import 'package:my_shop/core/compnds/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/view/product_home/haert_botton.dart';
import 'package:my_shop/featurers/product/view/product_detelis/product_detiels.dart';

class ProductCard extends StatefulWidget {
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
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // final ReviewModel? reviewModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          navigationTo(
              context: context,
              page: ProductDetiels(
                productModel: widget.productModel,
                // reviewModel: reviewModel,
                // listRiv: listRiv,
                
              ));
        },
        child: SizedBox(
          width: widget.size.width * 0.65,
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
                    child: Image.network(
                      widget.productModel.listUrlImage![0],
                      width: double.infinity,
                      height: widget.size.width *
                          0.5, // تقليل الارتفاع لتجنب overflow
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: widget.size.width * 0.02),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.size.width * 0.03),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: CusttonSubtitleText(
                            text: widget.productModel.marka ?? "marka",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w300,
                            fontSize: widget.size.width * 0.04,
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: CusttonTitleText(
                            text: widget.productModel.productTitle ??
                                "iphone 16 pro Max",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            fontSize: widget.size.width * 0.055,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: widget.size.width *
                        0.02), // إضافة مسافة صغيرة لتجنب الازدحام
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.size.width * 0.03),
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
                                      right: widget.size.width * 0.03),
                                  child: CusttonSubtitleText(
                                    text: widget.productModel.price ?? "7000",
                                    fontSize: widget.size.width * 0.065,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: widget.size.width * 0.02),
                                CusttonSubtitleText(
                                  text: "د.ل",
                                  fontWeight: FontWeight.w300,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: widget.size.width * 0.0469,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: HaertBotton(
                            productModel: widget.productModel,
                            size: widget.size,
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
