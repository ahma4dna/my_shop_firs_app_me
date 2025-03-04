import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/core/text/custton_title_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width * 0.6,
        height: size.height * 0.38,
        child: Card(
          elevation: 5,
          child: Column(
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
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CusttonSubtitleText(
                      text: "Marka",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w300,
                    ),
                    CusttonTitleText(
                      text: "iphone 16 pro Max",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CusttonSubtitleText(
                      text: "7000",
                      fontSize: 25,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  CusttonSubtitleText(
                    text: "د.ل",
                    fontWeight: FontWeight.w300,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconlyLight.heart,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
