import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/compnds/text/custton_title_text.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';

class CusttomNavgatioBar extends StatefulWidget {
  CusttomNavgatioBar({
    super.key,
    required this.cubit,
  });
  final RootAppCubit cubit;
  final PageController pageController = PageController();
  @override
  State<CusttomNavgatioBar> createState() => _CusttomNavgatioBarState();
}

class _CusttomNavgatioBarState extends State<CusttomNavgatioBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: widget.cubit.currentIndex,
      onDestinationSelected: (value) {
        widget.cubit.changeIndex(value);
        widget.pageController.jumpToPage(value);
      },
      destinations: [
        NavigationDestination(
          icon: Icon(IconlyLight.home),
          label: "الرئيسية",
          selectedIcon: Icon(IconlyBold.home),
        ),
        NavigationDestination(
          icon: true
              ? Badge(
                  backgroundColor: Colors.red,
                  label: CusttonTitleText(
                    text: "",
                    // fontSize: withe * 0.03,
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
    );
  }
}
