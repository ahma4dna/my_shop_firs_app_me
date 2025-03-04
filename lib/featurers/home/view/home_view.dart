import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/constant/constant.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/view/product_list.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              size: 30,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width * 0.05,
                ),
                CarouselSlider(
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
                  items: List.generate(Constant.images.length, (index) {
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
                  }),
                ),
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
                ProductList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
