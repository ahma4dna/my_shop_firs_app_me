import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/constant/constant.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/view/product_list.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool loading = true;
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<RootAppCubit, RootAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(
              IconlyBold.notification,
              size: size.width * 0.08,
            ),
            title: CusttonTitleText(
              text: "متجري",
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Skeletonizer(
              enabled: loading,
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
                        const CusttonTitleText(
                          text: "مضاف مؤخرأ",
                          fontSize: 27,
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        const Icon(
                          Icons.rocket_launch,
                          size: 30,
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
                        const CusttonTitleText(
                          text: "التصنيفات",
                          fontSize: 27,
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
          child: CategoryCard(
            size: size,
            icon: CategoryMosel.categryModel[index].icon,
            text: CategoryMosel.categryModel[index].text,
            onPressed: CategoryMosel.categryModel[index].onPressed,
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
