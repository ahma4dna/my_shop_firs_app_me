
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/constant/theam/theame.dart';
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
            extendBody: true,
            body: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: cubit.pages,
            ),
            bottomNavigationBar: Directionality(
              textDirection: TextDirection.rtl,
              child: SafeArea(
                child: SizedBox(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.w),
                    child: Container(
                      height: 200.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 85.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90.r)),
                          color: Theme.of(context).primaryColorDark,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 20),
                              // ignore: deprecated_member_use
                              color: AppColor.darkCardColor,
                              blurRadius: 45,
                            )
                          ]),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 50.0.w),
                        child: GNav(
                          selectedIndex: cubit.currentIndex,
                          onTabChange: (value) {
                            setState(() {
                              selctIcon = value;
                            });
              
                            cubit.changeIndex(value);
                            pageController.jumpToPage(value);
                          },
                          haptic: false, // haptic feedback
                          tabBorderRadius: 35.r, // tab button border
                          curve: Curves.linear, // tab animation curves
                          duration:
                              Duration(milliseconds: 100), // tab animation duration
                          gap: 10.w, // the tab button gap between icon and text
                          color: Colors.white, // unselected icon color
                          activeColor: Colors.blue,
                          // selected icon and text color
                          iconSize: 60.r, // tab button icon size
                          tabBackgroundColor:
                              Colors.blue[100]!, // selected tab background color
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.05.sw,
                            vertical: 0.03.sw,
                          ), // navigation bar padding
                          tabs: [
                            GButton(
                              iconSize: 80.r,
                              icon: selctIcon == 0
                                  ? IconlyBold.home
                                  : IconlyLight.home,
                              text: 'الرئيسية',
                            ),
                            GButton(
                              iconSize: 80.r,
                              icon: selctIcon == 1
                                  ? IconlyBold.search
                                  : IconlyLight.search,
                              text: 'البحث',
                            ),
                            GButton(
                              iconSize: 80.r,
                              icon:  selctIcon == 2
                                  ? IconlyBold.discovery
                                  : IconlyLight.discovery,
                              text: 'استكشاف',
                            ),
                            GButton(
                              iconSize: 80.r,
                              icon:  selctIcon == 3
                                  ? IconlyBold.profile
                                  : IconlyLight.profile,
                              text: 'حسابي',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}




