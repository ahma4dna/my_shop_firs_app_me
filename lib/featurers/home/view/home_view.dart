import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  List<String> images = [
    "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
    "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
    "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
  ];
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
          body: ListView(
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
                  autoPlayAnimationDuration: Duration(milliseconds: 800,),
                  viewportFraction: 0.8,
                ),
                items: List.generate(images.length, (index) {
                  return ClipRRect(
                     borderRadius: BorderRadius.circular(15),
                    child: Image(
                      width: size.width*0.9,
                      fit: BoxFit.cover,
                        image: NetworkImage(
                      images[index],
                    )),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
