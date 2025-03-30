import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/cart/cubit/cart_cubit.dart';

import 'package:my_shop/root/cubit/root_app_cubit.dart';

class RootScreen extends StatelessWidget {
  static const String routName = "RootScreen";
  RootScreen({super.key});
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double withe = MediaQuery.of(context).size.width;
    return BlocConsumer<RootAppCubit, RootAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<RootAppCubit>();
        cubit.setPageControler(pageController);
        return BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cartCubit = context.read<CartCubit>();
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: PageView(
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: cubit.pages,
                ),
                bottomNavigationBar: Directionality(
                  textDirection: TextDirection.rtl,
                  child: NavigationBar(
                    selectedIndex: cubit.currentIndex,
                    onDestinationSelected: (value) {
                      cubit.changeIndex(value);
                      pageController.jumpToPage(value);
                    },
                    destinations: [
                      NavigationDestination(
                        icon: Icon(IconlyLight.home),
                        label: "الرئيسية",
                        selectedIcon: Icon(IconlyBold.home),
                      ),
                      NavigationDestination(
                        icon: cartCubit.cardPurchases.isNotEmpty
                            ? Badge(
                                backgroundColor: Colors.red,
                                label: CusttonTitleText(
                                  text:
                                      cartCubit.cardPurchases.length.toString(),
                                  fontSize: withe * 0.03,
                                ),
                                child: Icon(IconlyLight.bag_2))
                            : Icon(IconlyLight.bag_2),
                        label: "السلة",
                        selectedIcon: Icon(IconlyBold.bag_2),
                      ),
                      NavigationDestination(
                        icon: Icon(IconlyLight.search),
                        label: "البحث",
                        selectedIcon: Icon(IconlyBold.search),
                      ),
                      NavigationDestination(
                        icon: Icon(IconlyLight.discovery),
                        label: "استكشاف",
                        selectedIcon: Icon(IconlyBold.discovery),
                      ),
                      NavigationDestination(
                        icon: Icon(IconlyLight.profile),
                        label: "حسابي",
                        selectedIcon: Icon(IconlyBold.profile),
                      ),
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
}
