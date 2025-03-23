import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/cubit/product_cubit.dart';
import 'package:my_shop/featurers/product/model/like_model/like_model.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/view/product_detelis/product_detiels.dart';
import 'package:my_shop/featurers/product/view/product_home/haert_botton.dart';

class Like extends StatefulWidget {
  const Like({super.key});

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  Future<void> getLike() async {
    Future.wait({
      context.read<ProductCubit>().getLike(),
    });
  }

  @override
  void initState() {
    getLike();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  IconlyBold.delete,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () async {
                  await context.read<ProductCubit>().unLikeAll();
                },
              ),
            ],
            title: CusttonTitleText(
              text: "المفضلة",
              fontSize: width * 0.05,
            ),
          ),
          body: state is GetLikeProductLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final like = context.read<ProductCubit>().likes;
                          return like.isEmpty
                              ? Center(
                                  child:
                                      CusttonTitleText(text: "المفضلة فارغة"),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7.0),
                                  child: LikeCard(
                                    productModel: context
                                        .read<ProductCubit>()
                                        .likes[index]
                                        .products!,
                                    size: MediaQuery.of(context).size,
                                    width: width,
                                    likeModel: context
                                        .read<ProductCubit>()
                                        .likes[index],
                                  ),
                                );
                        },
                        childCount:
                            context.read<ProductCubit>().likes.length ?? 0,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class LikeCard extends StatelessWidget {
  const LikeCard({
    super.key,
    required this.width,
    required this.likeModel,
    required this.size,
    required this.productModel,
  });

  final double width;
  final LikeModel? likeModel;
  final ProductModel productModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return likeModel == null
        ? Center(
            child: CusttonTitleText(text: "المفضلة فارغة"),
          )
        : SizedBox(
            width: width * 0.95,
            height: width * 0.37,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              navigationTo(
                                  context: context, page: ProductDetiels());
                            },
                            child: Image.network(
                              width: width * 0.3,
                              height: width * 0.37,
                              fit: BoxFit.cover,
                              likeModel?.products?.listUrlImage?[0] ??
                                  "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1822937191671cc8a91ab218.05490775___8b290af9010608bb458a1babb5018259.webp",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.05),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 2,
                                child: CusttonSubtitleText(
                                  text: likeModel?.products?.productTitle ??
                                      "iPhone 16 Pro Max ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: width * 0.06,
                                ),
                              ),
                              SizedBox(height: width * 0.03),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: CusttonSubtitleText(
                                          text:
                                              likeModel?.products?.price ?? "",
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          fontSize: width * 0.05,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        child: HaertBotton(
                                      size: size,
                                      productModel: productModel,
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
