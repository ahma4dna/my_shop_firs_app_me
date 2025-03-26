import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/function/my_dilog.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/inner_feature/recently/cubit/recently_cubit.dart';
import 'package:my_shop/featurers/inner_feature/recently/model/recently_model/recently_model.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/view/product_detelis/product_detiels.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Recently extends StatefulWidget {
  const Recently({super.key});

  @override
  State<Recently> createState() => _RecentlyState();
}

class _RecentlyState extends State<Recently> {
  Future<void> getRec() async {
    Future.wait({
      context.read<RecentlyCubit>().getRecently(),
    });
  }

  @override
  void initState() {
    getRec();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<RecentlyCubit, RecentlyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: context.read<RecentlyCubit>().recentlyList.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      IconlyBold.delete,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () async {
                      showDilogOkOrCncel(
                        context: context,
                        textWr: "هل تريد حدف السجل",
                        fctOk: () async {
                          await context
                              .read<RecentlyCubit>()
                              .clearAllRecently();
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        },
                      );
                    },
                  )
                : SizedBox(),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            title: CusttonTitleText(
              text: "سجل المشاهدة",
              fontSize: width * 0.05,
            ),
          ),
          body: Skeletonizer(
            enabled: state is GetRecentlyLoading ? true : false,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final recentlyCubit = context.read<RecentlyCubit>();

                    if (recentlyCubit.recentlyList.isEmpty) {
                      return SizedBox();
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: RrcentlyCard(
                        size: MediaQuery.of(context).size,
                        width: width,
                        recentlyModel: state is GetRecentlyLoading
                            ? damyListCrt[index]
                            : context.read<RecentlyCubit>().recentlyList[index],
                      ),
                    );
                  },
                      childCount: state is GetRecentlyLoading
                          ? damyListCrt.length
                          : context.read<RecentlyCubit>().recentlyList.length),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<RecentlyModel> damyListCrt = [
    RecentlyModel(
      products: ProductModel(
        catrgory: "Apple",
        productTitle: "Samsung Galaxy S25 Ultra",
        listUrlImage: [
          "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
          "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
          "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
        ],
        price: "5000",
      ),
    ),
    RecentlyModel(
      products: ProductModel(
        catrgory: "Apple",
        productTitle: "Samsung Galaxy S25 Ultra",
        listUrlImage: [
          "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
          "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
          "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
        ],
        price: "5000",
      ),
    ),
    RecentlyModel(
      products: ProductModel(
        catrgory: "Apple",
        productTitle: "Samsung Galaxy S25 Ultra",
        listUrlImage: [
          "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
          "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
          "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
        ],
        price: "5000",
      ),
    ),
    RecentlyModel(
      products: ProductModel(
        catrgory: "Apple",
        productTitle: "Samsung Galaxy S25 Ultra",
        listUrlImage: [
          "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
          "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
          "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
        ],
        price: "5000",
      ),
    ),
  ];
}

// ignore: must_be_immutable
class RrcentlyCard extends StatelessWidget {
  const RrcentlyCard({
    super.key,
    required this.width,
    required this.size,
    this.recentlyModel,
  });

  final double width;
  final RecentlyModel? recentlyModel;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return recentlyModel == null
        ? Center(
            child: CusttonTitleText(text: " فارغة"),
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
                                  context: context,
                                  page: ProductDetiels(
                                    productModel: recentlyModel!.products,
                                  ));
                            },
                            child: Image.network(
                              width: width * 0.3,
                              height: width * 0.37,
                              fit: BoxFit.cover,
                              recentlyModel?.products?.listUrlImage?[0] ??
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
                                  text: recentlyModel?.products?.productTitle ??
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
                                              recentlyModel?.products?.price ??
                                                  "",
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          fontSize: width * 0.05,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await context
                                            .read<RecentlyCubit>()
                                            .clearOneRecently(
                                              id: recentlyModel!.id!,
                                            );
                                      },
                                      icon: Icon(
                                        Icons.clear,
                                        color: Colors.red,
                                      ),
                                    ),
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
