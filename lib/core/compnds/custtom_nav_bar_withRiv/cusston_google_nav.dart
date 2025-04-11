  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_shop/constant/theam/theame.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';

SafeArea cussttomGoogleNavBar(BuildContext context, RootAppCubit cubit) {
    return SafeArea(
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
                          // setState(() {
                          //   selctIcon = value;
                          // });
            
                          // cubit.changeIndex(value);
                          // pageController.jumpToPage(value);
                        },
                        haptic: false, // haptic feedback
                        tabBorderRadius: 35.r, // tab button border
                       duration: const Duration(milliseconds: 20),
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
                          // GButton(
                          //   iconSize: 80.r,
                          //   icon: selctIcon == 0
                          //       ? IconlyBold.home
                          //       : IconlyLight.home,
                          //   text: 'الرئيسية',
                          // ),
                          // GButton(
                          //   iconSize: 80.r,
                          //   icon: selctIcon == 1
                          //       ? IconlyBold.search
                          //       : IconlyLight.search,
                          //   text: 'البحث',
                          // ),
                          // GButton(
                          //   iconSize: 80.r,
                          //   icon:  selctIcon == 2
                          //       ? IconlyBold.discovery
                          //       : IconlyLight.discovery,
                          //   text: 'استكشاف',
                          // ),
                          // GButton(
                          //   iconSize: 80.r,
                          //   icon:  selctIcon == 3
                          //       ? IconlyBold.profile
                          //       : IconlyLight.profile,
                          //   text: 'حسابي',
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
  }