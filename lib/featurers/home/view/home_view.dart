import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/constant/constant.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/cubit/product_cubit.dart';
import 'package:my_shop/featurers/product/view/product_home/product_list.dart';
import 'package:my_shop/featurers/search/cubit/search_cubit.dart';
import 'package:my_shop/featurers/search/view/search_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> fatchDataProduct() async {
    try {
      Future.wait({
        context.read<ProductCubit>().getProduct(),
      });
      Future.wait({
        context.read<ProductCubit>().getLike(),
      });
    } catch (e) {
      log(e.toString());
    }
  }

  
  @override
  void initState() {
    fatchDataProduct();
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                leading: Icon(
                  IconlyBold.notification,
                  size: size.width * 0.08,
                ),
                title: FittedBox(
                  child: CusttonTitleText(
                    text: "متجري",
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Skeletonizer(
              enabled:     state is GetProductLoading?true:false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.width * 0.05,
                      ),
                
                         slideer(size),
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          children: [
                            FittedBox(
                              child: CusttonTitleText(
                                text: "مضاف مؤخرأ",
                                fontSize: size.width * 0.06,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            FittedBox(
                              child: Icon(
                                Icons.rocket_launch,
                                size: size.width * 0.07,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.06,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ProductList()),
                      SizedBox(
                        height: size.width * 0.06,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          children: [
                            CusttonTitleText(
                              text: "التصنيفات",
                              fontSize: size.width * 0.06,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.03,
                      ),
                      CategoryList(size: size)
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  CarouselSlider slideer(Size size) {
    return CarouselSlider(
      options: CarouselOptions(
        height: size.width * 0.4,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.easeInOut,
        autoPlayAnimationDuration: Duration(
          milliseconds: 800,
        ),
        viewportFraction: 0.8,
      ),
      items: sliderList(size),
    );
  }

  List<Widget> sliderList(Size size) {
    return List.generate(Constant.images.length, (index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image(
          width: size.width * 0.9,
          fit: BoxFit.cover,
          image: NetworkImage(
            Constant.images[index],
          ),
        ),
      );
    });
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 1,
      height: size.height * 0.2,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () async {
              context
                  .read<SearchCubit>()
                  .selectCategoryHome(CategoryMosel.categryModel[index].text);
              navigationTo(context: context, page: SearchView());
            },
            child: CategoryCard(
              size: size,
              icon: CategoryMosel.categryModel[index].icon,
              text: CategoryMosel.categryModel[index].text,
            ),
          ),
        ),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.size,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  final Size size;
  final IconData icon;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.3,
          height: size.height * 0.13,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    icon,
                    size: size.width * 0.13,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.width * 0.01,
        ),
        CusttonTitleText(
          text: text,
          fontSize: size.width * 0.045,
        ),
      ],
    );
  }
}
