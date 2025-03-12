

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../constant/theam/theame.dart';

class SetingView extends StatefulWidget {
  const SetingView({super.key});

  @override
  State<SetingView> createState() => _SetingViewState();
}

class _SetingViewState extends State<SetingView> {
  bool valueBool = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<RootAppCubit, RootAppState>(
      listener: (context, state) {},
      builder: (context, state) {

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Skeletonizer(
              enableSwitchAnimation: true,
              enabled: loading,
              child: ListView(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.06,
                        backgroundColor:
                            Theme.of(context).appBarTheme.backgroundColor,
                        child: Icon(
                          IconlyBold.profile,
                          color: Theme.of(context).iconTheme.color,
                          size: size.width * 0.075,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CusttonTitleText(
                              text: "الاسم",
                              fontSize: size.width * 0.05,
                            ),
                            CusttonSubtitleText(
                              text: "ahmad@gmail.com",
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  CusttonTitleText(
                    text: "عام",
                    fontSize: size.width * 0.05,
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: size.width * 0.55,
                    child: Card(
                      child: Column(
                        children: [
                          MyListTile(
                            size: size,
                            name: 'طلباتي',
                            icone: IconlyBold.buy,
                            onTap: () {},
                          ),
                          Divider(
                            endIndent: 15,
                            indent: 15,
                          ),
                          MyListTile(
                            size: size,
                            name: "المفضلة",
                            icone: IconlyBold.heart,
                            onTap: () {},
                          ),
                          Divider(
                            endIndent: 15,
                            indent: 15,
                          ),
                          MyListTile(
                            size: size,
                            name: 'تمت مشاهدنه مسبقا',
                            icone: IconlyBold.time_square,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  CusttonTitleText(
                    text: "الاعدادات",
                    fontSize: size.width * 0.05,
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: size.width * 0.55,
                    child: Card(
                      child: Column(
                        children: [
                          MyListTile(
                            size: size,
                            name: "الثيم",
                            icone: Icons.dark_mode_sharp,
                            onTap: () {
                              showThemeSelector(context, size);
                            },
                          ),
                          Divider(
                            endIndent: 15,
                            indent: 15,
                          ),
                          MyListTile(
                            size: size,
                            name: "اللغة",
                            icone: Icons.language,
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(35),
                                  ),
                                ),
                                context: context,
                                builder: (context) => SizedBox(
                                  width: double.infinity,
                                  height: size.width * 0.8,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.width * 0.05,
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        width: 35,
                                        height: 4,
                                      ),
                                      SizedBox(
                                        height: size.width * 0.04,
                                      ),
                                      CusttonTitleText(
                                        text: "خيارات اللغة",
                                        fontSize: 20,
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: size.width * 0.08,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: ListTile(
                                          title: CusttonTitleText(
                                            text: "العربية",
                                          ),
                                          trailing: Icon(
                                              false
                                                  // ignore: dead_code
                                                  ? Icons.radio_button_unchecked
                                                  : Icons.radio_button_checked,
                                              color: AppColor.darkPrimaryColor),
                                          onTap: () async {},
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.width * 0.04,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: ListTile(
                                          title: CusttonTitleText(
                                            text: "English",
                                          ),
                                          trailing: Icon(
                                              false
                                                  // ignore: dead_code
                                                  ? Icons.radio_button_unchecked
                                                  : Icons.radio_button_checked,
                                              color: AppColor.darkPrimaryColor),
                                          onTap: () async {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          Divider(
                            endIndent: 15,
                            indent: 15,
                          ),
                          MyListTile(
                            size: size,
                            name: "العناوين",
                            icone: IconlyBold.location,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.06,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CusttonTitleText(
                      text: "تسجيل الخروج",
                      color: Colors.blue,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showThemeSelector(
    BuildContext context,
    Size size,
  ) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      builder: (context) {
        final cubit = context.read<RootAppCubit>();
        return SizedBox(
          width: double.infinity,
          height: size.width * 0.8,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width * 0.05,
                ),
                Container(
                  color: Colors.grey,
                  width: 35,
                  height: 4,
                ),
                SizedBox(
                  height: size.width * 0.04,
                ),
                CusttonTitleText(
                  text: "خيارات العرض",
                  fontSize: size.width * 0.05,
                ),
                Divider(),
                SizedBox(
                  height: size.width * 0.05,
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: CusttonTitleText(
                    text: "وضع النظام",
                    fontSize: size.width * 0.05,
                  ),
                  trailing: Radio(
                    value: AppThemeMode.system,
                    groupValue: cubit.themeMode,
                    onChanged: (value) => cubit.setTheme(AppThemeMode.system),
                    activeColor: Colors.blue,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.light_mode),
                  title: CusttonTitleText(
                    text: "الوضع الفاتح",
                    fontSize: size.width * 0.05,
                  ),
                  trailing: Radio(
                    value: AppThemeMode.light,
                    groupValue: cubit.themeMode,
                    onChanged: (value) => cubit.setTheme(AppThemeMode.light),
                    activeColor: Colors.blue,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.dark_mode),
                  title: CusttonTitleText(
                    text: "الوضع الداكن",
                    fontSize: size.width * 0.05,
                  ),
                  trailing: Radio(
                    value: AppThemeMode.dark,
                    groupValue: cubit.themeMode,
                    onChanged: (value) => cubit.setTheme(AppThemeMode.dark),
                    activeColor: Colors.blue,
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
    required this.size,
  });
  final String name;
  final IconData icone;
  final void Function()? onTap;
  final Color? color;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: Icon(
        icone,
        color: color,
        size: size.width * 0.05,
      ),
      onTap: onTap,
      title: CusttonTitleText(
        text: name,
        fontSize: size.width * 0.05,
      ),
    );
  }
}
