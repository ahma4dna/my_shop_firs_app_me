import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/constant/constant.dart';
import 'package:my_shop/core/compnds/custtom_text_form_feild.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/compnds/text/custton_subtitle_text.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/view/product_detelis/product_detiels.dart';
import 'package:my_shop/featurers/search/cubit/search_cubit.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  Future<void> getData() async {
    if (context.read<RootAppCubit>().currentIndex == 2) {
      context.read<SearchCubit>().clearFilter();
    }

    await Future.wait([
      context.read<SearchCubit>().getProduct(),
    ]);
   
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: CusttonSubtitleText(
                text: "البحت",
                fontSize: width * 0.065,
              ),
            ),
            body: RefreshIndicator(
              backgroundColor: Theme.of(context).iconTheme.color,
              color: Theme.of(context).primaryColor,
              onRefresh: getData,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: BouncingScrollPhysics( parent: AlwaysScrollableScrollPhysics()),
                child: Skeletonizer(
                  enabled: state is GetProductSeLoading ? true : false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: SizedBox(
                            width: width * 0.95,
                            height: width * 0.15,
                            child: CusttomTextFormFeild(
                              onChanged: (value) async {
                                cubit.serchByName(name: value);
                              },
                              hintStyle: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: width * 0.052,
                              ),
                              prefixIcon: Icon(Icons.search),
                              controller: controller,
                              hint: "البحت",
                            ),
                          ),
                        ),
                      ),
                      if (cubit.selectedCategory != null ||
                          cubit.selectedMarka != null) ...[
                        CleraAllFilter(width: width),
                        SizedBox(
                          height: width * 0.02,
                        ),
                      ],
                      SizedBox(
                        height: width * 0.05,
                      ),
                      ListFilterCategory(
                        width: width,
                      ),
                      SizedBox(
                        height: width * 0.05,
                      ),
                      ListFilterPrand(
                        width: width,
                      ),
                      SizedBox(
                        height: width * 0.05,
                      ),
                      CustomScrollView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        slivers: [
                          Builder(builder: (context) {
                            List<ProductModel> products;
                            if (cubit.productsSearchByMarkaAndCat.isNotEmpty) {
                              products = cubit.productsSearchByMarkaAndCat;
                            } else if (cubit.productsSearch.isNotEmpty) {
                              products = cubit.productsSearch;
                            } else {
                              products = cubit.products;
                            }

                            return SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5), // مسافة بين العناصر
                                  child: SearchWidget(
                                    width: width,
                                    productModel: state is GetProductSeLoading
                                        ? damylist[index]
                                        : products[index],
                                  ),
                                );
                              },
                                  childCount: state is GetProductSeLoading
                                      ? damylist.length
                                      : products.length // عدد العناصر
                                  ),
                            );
                          }),
                        ],
                      ),
                      SizedBox(
                        height: kBottomNavigationBarHeight + width * 0.08,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<ProductModel> damylist = [
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
    ProductModel(
      catrgory: "Apple",
      productTitle: "Samsung Galaxy S25 Ultra",
      listUrlImage: [
        "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
        "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
        "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
      ],
      price: "5000",
    ),
  ];
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.width, this.productModel});
  final double width;
  final ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 95,
      height: width * 0.37,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: GestureDetector(
                    onTap: () {
                      navigationTo(
                        context: context,
                        page: ProductDetiels(
                          productModel: productModel,
                        ),
                      );
                    },
                    child: Image.network(
                      width: width * 0.3,
                      height: width * 0.37,
                      fit: BoxFit.cover,
                      productModel?.listUrlImage?[0] ??
                          "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1822937191671cc8a91ab218.05490775___8b290af9010608bb458a1babb5018259.webp",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: CusttonSubtitleText(
                          text: productModel?.marka ?? "Apple",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: width * 0.02,
                      ),
                      Flexible(
                        flex: 2,
                        child: CusttonSubtitleText(
                          text:
                              productModel?.productTitle ?? "iPhone 16 Pro Max",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontSize: width * 0.05,
                        ),
                      ),
                      SizedBox(
                        height: width * 0.025,
                      ),
                      Flexible(
                        child: CusttonSubtitleText(
                          text: productModel?.price ?? " 7000 دل",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          color: Theme.of(context).iconTheme.color,
                          fontSize: width * 0.05,
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
    );
  }
}

class CleraAllFilter extends StatelessWidget {
  const CleraAllFilter({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.38),
      child: TextButton(
        onPressed: () {
          context.read<SearchCubit>().clearFilter();
        },
        child: CusttonSubtitleText(
          text: "محو الفلاتر",
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}

class ListFilterCategory extends StatefulWidget {
  const ListFilterCategory({super.key, required this.width});
  final double width;

  @override
  State<ListFilterCategory> createState() => _ListFilterCategoryState();
}

class _ListFilterCategoryState extends State<ListFilterCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * 1,
      height: widget.width * 0.085,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.width * 0.02),
          child: GestureDetector(
            onTap: () {
              setState(() {
                context.read<SearchCubit>().selectCategory(
                      CategoryMosel.caeoryText[index],
                    );
              });
            },
            child: Container(
              width: widget.width * 0.25,
              height: widget.width * 0.075,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 2,
                  color: context.read<SearchCubit>().selectedCategory ==
                          CategoryMosel.caeoryText[index]
                      ? Colors.blue
                      : Colors.transparent,
                ),
              ),
              child: Center(
                child: FittedBox(
                  child: CusttonSubtitleText(
                    text: CategoryMosel.caeoryText[index],
                    color: Theme.of(context).iconTheme.color,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: CategoryMosel.caeoryText.length,
      ),
    );
  }
}

class ListFilterPrand extends StatelessWidget {
  const ListFilterPrand({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 1,
      height: width * 0.085,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: GestureDetector(
            onTap: () {
              context.read<SearchCubit>().selectMarka(
                    PrandModel.prand[index],
                  );
            },
            child: Container(
              width: width * 0.25,
              height: width * 0.075,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 2,
                  color: context.read<SearchCubit>().selectedMarka ==
                          PrandModel.prand[index]
                      ? Colors.blue
                      : Colors.transparent,
                ),
              ),
              child: Center(
                child: FittedBox(
                  child: CusttonSubtitleText(
                    text: PrandModel.prand[index],
                    color: Theme.of(context).iconTheme.color,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: PrandModel.prand.length,
      ),
    );
  }
}
