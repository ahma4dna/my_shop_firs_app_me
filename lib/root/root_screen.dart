import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';

class RootScreen extends StatefulWidget {
  static const String routName = "RootScreen";

  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selctIcon = 0;
  final PageController pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
@override
  void initState() {
    context.read<RootAppCubit>().changeIndex(0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<RootAppCubit, RootAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<RootAppCubit>();
        // cubit.setPageControler(pageController);

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
  }
}
