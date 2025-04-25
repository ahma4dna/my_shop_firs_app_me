import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/function/my_dilog.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/compnds/text/custton_subtitle_text.dart';
import 'package:my_shop/core/compnds/text/custton_title_text.dart';
import 'package:my_shop/featurers/auth/cubit/auth_cubit.dart';
import 'package:my_shop/featurers/auth/view/auth_view.dart';
import 'package:my_shop/featurers/inner_feature/like/view/like.dart';
import 'package:my_shop/featurers/inner_feature/recently/view/recently.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';

class SetingView extends StatelessWidget {
  const SetingView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignOutSucecc) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AuthScreen()),
            );
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.07.sw),
            child: ListView(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        child: CircleAvatar(
                          radius: 55.r,
                          backgroundColor:
                              Theme.of(context).appBarTheme.backgroundColor,
                          child: Icon(
                            IconlyBold.profile,
                            color: Theme.of(context).iconTheme.color,
                            size: 100.r,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0.03.sw,
                      ),
                      Flexible(
                        flex:8,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CusttonTitleText(
                              text: cubit.userModel?.name ?? "not name",
                              fontSize: 65.sp,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CusttonSubtitleText(
                                text: cubit.userModel?.email ?? "not email",
                                fontSize: 60.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.03.sw,
                ),
                CusttonTitleText(
                  text: "عام",
                  fontSize: 65.sp,
                ),
                SizedBox(
                  height: 0.03.sw,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 0.55.sw,
                  child: Card(
                    child: Column(
                      children: [
                        Flexible(
                          child: MyListTile(
                            name: 'طلباتي',
                            icone: IconlyBold.buy,
                            onTap: () {},
                          ),
                        ),
                        Divider(
                          endIndent: 15,
                          indent: 15,
                        ),
                        Flexible(
                          child: MyListTile(
                            name: "المفضلة",
                            icone: IconlyBold.heart,
                            onTap: () {
                              navigationTo(context: context, page: Like());
                            },
                          ),
                        ),
                        Divider(
                          endIndent: 15,
                          indent: 15,
                        ),
                        Flexible(
                          child: MyListTile(
                            name: 'تمت مشاهدنه مسبقا',
                            icone: IconlyBold.time_square,
                            onTap: () {
                              navigationTo(context: context, page: Recently());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.03.sw,
                ),
                CusttonTitleText(
                  text: "الاعدادات",
                  fontSize: 65.sp,
                ),
                SizedBox(
                  height: 0.03.sw,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 0.55.sw,
                  child: Card(
                    child: Column(
                      children: [
                        Flexible(
                          child: MyListTile(
                            name: "الثيم",
                            icone: Icons.dark_mode_sharp,
                            onTap: () {
                              showThemeSelector(
                                context,
                              );
                            },
                          ),
                        ),
                        Divider(
                          endIndent: 15,
                          indent: 15,
                        ),
                        Flexible(
                          child: MyListTile(
                            name: "اللغة",
                            icone: Icons.language,
                            onTap: () {
                              showDilogOkOrCncel(
                                  context: context,
                                  textWr: "ستتوفر قريبا",
                                  fctOk: () {
                                    Navigator.pop(context);
                                  },
                                  isErorr: false,
                                  textOk: "حسنا");
                            },
                          ),
                        ),
                        Divider(
                          endIndent: 15,
                          indent: 15,
                        ),
                        Flexible(
                          child: MyListTile(
                            name: "العناوين",
                            icone: IconlyBold.location,
                            onTap: () {
                              showDilogOkOrCncel(
                                  context: context,
                                  textWr: "ستتوفر قريبا",
                                  fctOk: () {
                                    Navigator.pop(context);
                                  },
                                  isErorr: false,
                                  textOk: "حسنا");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.06.sw,
                ),
                TextButton(
                  onPressed: () async {
                    showDilogOkOrCncel(
                      context: context,
                      textWr: "هل تريد تسجيل الخروج",
                      isErorr: true,
                      fctOk: () async {
                        await context
                            .read<AuthCubit>()
                            .signOut(context: context);
                      },
                    );
                  },
                  child: CusttonTitleText(
                    text: "تسجيل الخروج",
                    color: Colors.blue,
                    fontSize: 0.05.sw,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showThemeSelector(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(65.r)),
      ),
      builder: (context) {
        final cubit = context.read<RootAppCubit>();
        return SizedBox(
          width: 1.sw,
          height: 0.8.sw,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.05.sw,
                ),
                Container(
                  color: Colors.grey,
                  width: 65.w,
                  height: 8.h,
                ),
                SizedBox(
                  height: 0.04.sw,
                ),
                Flexible(
                  child: CusttonTitleText(
                    text: "خيارات العرض",
                    fontSize: 65.sp,
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 0.05.sw,
                ),
                Flexible(
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: CusttonTitleText(
                      text: "وضع النظام",
                      fontSize: 65.sp,
                    ),
                    trailing: Radio(
                      value: AppThemeMode.system,
                      groupValue: cubit.themeMode,
                      onChanged: (value) => cubit.setTheme(AppThemeMode.system),
                      activeColor: Colors.blue,
                    ),
                  ),
                ),
                Flexible(
                  child: ListTile(
                    leading: Icon(Icons.light_mode),
                    title: CusttonTitleText(
                      text: "الوضع الفاتح",
                      fontSize: 65.sp,
                    ),
                    trailing: Radio(
                      value: AppThemeMode.light,
                      groupValue: cubit.themeMode,
                      onChanged: (value) => cubit.setTheme(AppThemeMode.light),
                      activeColor: Colors.blue,
                    ),
                  ),
                ),
                Flexible(
                  child: ListTile(
                    leading: Icon(Icons.dark_mode),
                    title: CusttonTitleText(
                      text: "الوضع الداكن",
                      fontSize: 65.sp,
                    ),
                    trailing: Radio(
                      value: AppThemeMode.dark,
                      groupValue: cubit.themeMode,
                      onChanged: (value) => cubit.setTheme(AppThemeMode.dark),
                      activeColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.name,
    required this.icone,
    this.onTap,
    this.color,
  });
  final String name;
  final IconData icone;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: Icon(
        icone,
        color: color,
        size: 75.r,
      ),
      onTap: onTap,
      title: CusttonTitleText(
        text: name,
        fontSize: 70.sp,
      ),
    );
  }
}
