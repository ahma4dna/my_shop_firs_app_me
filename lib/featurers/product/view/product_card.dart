import 'package:flutter/material.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/view/haert_botton.dart';
import 'package:my_shop/featurers/product/view/product_detiels.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.size,
    this.width,
    this.height,
  });

  final Size size;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigationTo(context: context, page: ProductDetiels());
      },
      child: FittedBox(
  child: SizedBox(
    width: width,
    height: height,
    child: Card(
      elevation: 5,
      child: SingleChildScrollView(  // تمت إضافة هذه السطر
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                width: double.infinity,
                height: size.width * 0.5,
                "https://storage.store.arriadagroup.com/images/products/4660/images/8b290af9010608bb458a1babb5018259.webp",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.width * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: CusttonSubtitleText(
                      text: "Marka",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w300,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  FittedBox(
                    child: CusttonTitleText(
                      text: "iphone 16 pro Max",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: size.width * 0.055,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: FittedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.03),
                          child: CusttonSubtitleText(
                            text: "7000",
                            fontSize: size.width * 0.065,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
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
                HaertBotton(
                  size: size,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ),
)

    );
  }
}
