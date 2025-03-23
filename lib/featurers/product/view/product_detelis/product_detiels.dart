import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/function/naviation_to_replace.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/cart/cubit/cart_cubit.dart';
import 'package:my_shop/featurers/inner_feature/recently/cubit/recently_cubit.dart';
import 'package:my_shop/featurers/product/cubit/product_cubit.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/view/product_detelis/botton_seat_detils.dart';
import 'package:my_shop/featurers/product/view/product_detelis/image/viewer_image.dart';
import 'package:my_shop/featurers/product/view/product_detelis/review/rating_and_rivew.dart';
import 'package:my_shop/featurers/product/view/product_detelis/review/rating_widget.dart';
import 'package:my_shop/featurers/product/view/product_detelis/review/review_card.dart';
import 'package:my_shop/featurers/product/view/product_detelis/review/review_card_me.dart';
import 'package:my_shop/featurers/product/view/product_home/haert_botton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductDetiels extends StatefulWidget {
  const ProductDetiels({super.key, this.productModel});
  final ProductModel? productModel;

  @override
  State<ProductDetiels> createState() => _ProductDetielsState();
}

class _ProductDetielsState extends State<ProductDetiels> {
  List<String> imags = [
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1297659722671cc8aa1e7554.86197183___88c16d3f1f4ecaa611cccf4a8f9242bd.webp",
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/406131928671cc8a9bdfed3.62403773___df0d79728fe42bd67395707ed34c5860.webp",
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1044037892671cc8aa62cff5.58895543___c0d1502c00dd051098ebd16552a31ac4.webp",
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1822937191671cc8a91ab218.05490775___8b290af9010608bb458a1babb5018259.webp",
  ];
  int selctedImage = 0;
  Future<void> fatchDetiels() async {
    Future.wait({
      context
          .read<ProductCubit>()
          .getReview(productId: widget.productModel!.productId!),
      context.read<CartCubit>().getCards(),
    });
    Future.wait({
      context.read<RecentlyCubit>().addRecently(data: {
        "for_product": widget.productModel!.productId!,
        "for_user": Supabase.instance.client.auth.currentUser!.id,
      }, productId: widget.productModel!.productId!)
    });
  }

  @override
  void initState() {
    fatchDetiels();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<ProductCubit>().reviews;
        final cubitMe = context.read<ProductCubit>();
        return Scaffold(
          bottomSheet: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Skeletonizer(
                enabled: context.read<ProductCubit>().isLoadingriv,
                child: BottonSeatDetils(
                  onPressed2: () async {},
                  productModel: widget.productModel,
                  size: size,
                  onPressed: () async {
                    await context.read<CartCubit>().addCards(
                        prodctId: widget.productModel!.productId!,
                        data: {
                          "quantiti": 1,
                          "chach_pay": false,
                          "for_product": widget.productModel?.productId,
                          "for_user":
                              Supabase.instance.client.auth.currentUser!.id,
                          "total_price": widget.productModel?.price,
                        });
                  },
                  state: state,
                ),
              );
            },
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.keyboard_arrow_right),
              ),
            ],
            title: FittedBox(
              child: CusttonTitleText(
                text: "تفاصيل المنتج",
                fontSize: size.width * 0.05,
              ),
            ),
            centerTitle: true,
          ),
          body: Skeletonizer(
            enabled: context.read<ProductCubit>().isLoadingriv,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: HaertBotton(
                            productModel: widget.productModel,
                            size: size,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Flexible(
                          flex: 3,
                          child: FittedBox(
                            child: CusttonTitleText(
                              text: widget.productModel?.productTitle ??
                                  "iPhone 16 Pro Max",
                              fontSize: size.width * 0.05,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    imageSelct(context, size),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Directionality(
                        textDirection: TextDirection.rtl,
                        child: selectListImage(size)),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CusttonTitleText(
                                text: "وصف المنتج",
                                fontSize: size.width * 0.05,
                              ),
                              SizedBox(
                                height: size.width * 0.02,
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: CusttonTitleText(
                                  text: widget.productModel?.descripsion ?? "",
                                  maxLines: 35,
                                  fontSize: 14,
                                  color: Theme.of(context).iconTheme.color,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: size.width * 0.05,
                              ),
                              FittedBox(
                                child: CusttonTitleText(
                                  text: "قيم المنتج",
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: size.width * 0.05,
                              ),
                            ],
                          ),
                          RatingWidget1(
                            size: size,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Center(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: RatingBar.builder(
                          initialRating: (cubitMe.rateuser)?.toDouble() ?? 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          glowColor: Colors.transparent,
                          itemPadding: EdgeInsets.symmetric(horizontal: 18.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.blue[200],
                          ),
                          onRatingUpdate: (rating) async {
                            await navigationToReplace(
                              context: context,
                              page: RatingAndRivew(
                                size: size,
                                productModel: widget.productModel,
                                initialRating:
                                    (cubitMe.rateuser)?.toDouble() ?? rating,
                                cubitMe: cubitMe,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (cubitMe.rateuser != null) ...[
                            CusttonTitleText(
                              text: "مراجعتي",
                              fontSize: size.width * 0.05,
                            ),
                            SizedBox(
                              height: size.width * 0.03,
                            ),
                            ReviewCardMe(
                              cubitMe: cubitMe,
                              size: size,
                            ),
                            TextButton(
                              onPressed: () {
                                navigationTo(
                                  context: context,
                                  page: RatingAndRivew(
                                    size: size,
                                    productModel: widget.productModel,
                                    initialRating:
                                        (cubitMe.rateuser)!.toDouble(),
                                    cubitMe: cubitMe,
                                  ),
                                );
                              },
                              child: CusttonTitleText(
                                text: "تعديل المراجعة",
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: size.width * 0.03,
                            ),
                          ],
                          CusttonTitleText(
                            text: "باقي المراجعات",
                            fontSize: size.width * 0.05,
                          ),
                          SizedBox(
                            height: size.width * 0.03,
                          ),
                          ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 5),
                              child: ReviewCard(
                                reviewModel: cubit[index],
                                size: size,
                                // reviewModel: widget.reviewModel!,
                              ),
                            ),
                            itemCount: cubit.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kBottomNavigationBarHeight + 70,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding imageSelct(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          navigationTo(
            context: context,
            page: ViewerImage(
              image: widget.productModel?.listUrlImage![selctedImage] ??
                  imags[selctedImage],
            ),
          );
        },
        child: Hero(
          tag: widget.productModel?.listUrlImage![selctedImage] ??
              imags[selctedImage],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              height: size.width * 1,
              fit: BoxFit.cover,
              widget.productModel?.listUrlImage![selctedImage] ??
                  imags[selctedImage],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox selectListImage(Size size) {
    return SizedBox(
      height: size.width * 0.2,
      width: size.width * 1,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selctedImage = index;
              });
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: selctedImage == index
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      height: selctedImage == index
                          ? size.width * 0.24
                          : size.width * 0.2,
                      width: selctedImage == index
                          ? size.width * 0.24
                          : size.width * 0.2,
                      fit: BoxFit.cover,
                      widget.productModel?.listUrlImage![index] ?? imags[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: widget.productModel?.listUrlImage!.length ?? imags.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
