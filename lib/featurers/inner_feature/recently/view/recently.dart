import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/inner_feature/recently/cubit/recently_cubit.dart';
import 'package:my_shop/featurers/inner_feature/recently/model/recently_model/recently_model.dart';
import 'package:my_shop/featurers/product/view/product_detelis/product_detiels.dart';

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
            actions: [
              IconButton(
                icon: Icon(
                  IconlyBold.delete,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () async {
                  await context.read<RecentlyCubit>().clearAllRecently();
                },
              ),
            ],
            title: CusttonTitleText(
              text: "سجل المشاهدة",
              fontSize: width * 0.05,
            ),
          ),
          body: state is GetRecentlyLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : CustomScrollView(
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
                            recentlyModel: context
                                .read<RecentlyCubit>()
                                .recentlyList[index],
                          ),
                        );
                      },
                          childCount: context
                              .read<RecentlyCubit>()
                              .recentlyList
                              .length),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

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
                                  context: context, page: ProductDetiels());
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
