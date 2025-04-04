import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/function/my_dilog.dart';
import 'package:my_shop/core/compnds/text/custton_subtitle_text.dart';
import 'package:my_shop/core/compnds/text/custton_title_text.dart';
import 'package:my_shop/featurers/cart/cubit/cart_cubit.dart';
import 'package:my_shop/featurers/cart/model/cart_model/cart_model.dart';
import 'package:my_shop/featurers/cart/view/cart_widget.dart';
import 'package:my_shop/featurers/cart/view/cheak_botton_sheat.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
      final ScrollController _scrollController = ScrollController();

  Future<void> getCards() async {
    await context.read<CartCubit>().getCards();
      
  }

  @override
  void initState() {
    getCards();
    context.read<CartCubit>().totalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<CartCubit>();

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            bottomSheet: context.read<CartCubit>().cardPurchases.isEmpty
                ? null
                : CheakBottonSheat(width: width),
            appBar: AppBar(
              centerTitle: true,
              title: CusttonSubtitleText(
                text: "السله",
                fontSize: width * 0.065,
              ),
              actions: [
                cubit.cardPurchases.isNotEmpty
                    ? IconButton(
                        onPressed: () async {
                          showDilogOkOrCncel(
                            context: context,
                            textWr: "هل تريد حدف السله",
                            isErorr: true,
                            fctOk: () async {
                              await cubit.removeAllCards();
                              await cubit.getCards();
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            },
                          );
                        },
                        icon: Icon(IconlyBold.delete),
                        color: Colors.red,
                      )
                    : SizedBox(),
              ],
            ),
            body: state is GetCardsSucecc &&
                    context.read<CartCubit>().cardPurchases.isEmpty
                ? Center(
                    child: CusttonTitleText(text: "السله فارغة"),
                  )
                : Skeletonizer(
                    enabled: state is GetCardsLoading ? true : false,
                    child: RefreshIndicator(
                          backgroundColor: Theme.of(context).iconTheme.color,
                color: Theme.of(context).primaryColor,
                      onRefresh: getCards,
                      child: ListView(
                        controller: _scrollController,
                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          CustomScrollView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5),
                                      child: CartWidget(
                                        width: width,
                                        cartModel: state is GetCardsLoading
                                            ? damyListCrt[index]
                                            : context
                                                .read<CartCubit>()
                                                .cardPurchases[index],
                                        index: index, // تمرير index لكل عنصر
                                      ),
                                    );
                                  },
                                  childCount: state is GetCardsLoading
                                      ? damyListCrt.length
                                      : context
                                          .read<CartCubit>()
                                          .cardPurchases
                                          .length,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kBottomNavigationBarHeight + width * 0.1,
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  List<CartModel> damyListCrt = [
    CartModel(
      quantiti: 3,
      totalPrice: 2000,
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
    CartModel(
      quantiti: 3,
      totalPrice: 2000,
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
    CartModel(
      quantiti: 3,
      totalPrice: 2000,
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
    CartModel(
      quantiti: 3,
      totalPrice: 2000,
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
    CartModel(
      quantiti: 3,
      totalPrice: 2000,
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
    CartModel(
      quantiti: 3,
      totalPrice: 2000,
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
    CartModel(
      quantiti: 3,
      totalPrice: 2000,
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
    CartModel(
      quantiti: 3,
      totalPrice: 2000,
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
    CartModel(
      quantiti: 3,
      totalPrice: 2000,
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
    CartModel(
      quantiti: 3,
      totalPrice: 2000,
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
