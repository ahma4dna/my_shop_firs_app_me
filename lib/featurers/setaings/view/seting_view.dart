import 'dart:async';

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
        final cubit = context.read<RootAppCubit>();
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

                          radius:size.width*0.06,
                          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                          child: Icon(
                            IconlyBold.profile,
                            color: Theme.of(context).iconTheme.color,
                            size: size.width*0.075,
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
                              fontSize: size.width*0.05,
                            ),
                            CusttonSubtitleText(
                              text: "ahmad@gmail.com",
                              fontSize: size.width*0.05,
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
                    fontSize: size.width*0.05,
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
                    fontSize: size.width*0.05,
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
                              showSelctTheame(context, size, cubit);
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
                        fontSize: size.width*0.05,
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showSelctTheame(
      BuildContext context, Size size, RootAppCubit cubit) {
    return showModalBottomSheet(
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
              text: "خيارات العرض",
              fontSize: size.width*0.05,
            ),
            Divider(),
            SizedBox(
              height: size.width * 0.08,
            ),
            lightTheam(cubit),
            SizedBox(
              height: size.width * 0.04,
            ),
            darkTheame(cubit),
          ],
        ),
      ),
    );
  }

  Directionality lightTheam(RootAppCubit cubit) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        leading: Icon(
          Icons.dark_mode,
        ),
        title: CusttonTitleText(
          text: "الوضع الفاتح",
        ),
        trailing: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Icon(
              cubit.getDark
                  ? Icons.radio_button_unchecked
                  : Icons.radio_button_checked,
                  key: ValueKey<bool>(cubit.getDark),
              color: AppColor.darkPrimaryColor),
        ),
        onTap: () async {
          if (cubit.getDark == true) {
            setState(() {
              valueBool = false;
            });
            await cubit.setTheam(theameValue: valueBool);
          }
        },
      ),
    );
  }

  Directionality darkTheame(RootAppCubit cubit) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        leading: Icon(
          Icons.dark_mode,
        ),
        title: CusttonTitleText(
          text: "الوضع الداكن",
        ),
        trailing: AnimatedSwitcher(
          duration: Duration(milliseconds:300 ),
          child: Icon(
              cubit.getDark
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
                   key: ValueKey<bool>(cubit.getDark),
              color: AppColor.darkPrimaryColor),
        ),
        onTap: () async {
          if (cubit.getDark == false) {
            setState(() {
              valueBool = true;
            });
            await cubit.setTheam(theameValue: valueBool);
          }
        },
      ),
    );
  }
}

Widget displayOption(
    IconData icon, String text, bool isSelected, void Function()? onTap) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: CusttonTitleText(text: text),
        trailing: Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: AppColor.darkPrimaryColor),
        onTap: onTap),
  );
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.name,
    required this.icone,
    this.onTap,
    this.color, required this.size,
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
        size: size.width*0.05,
      ),
      onTap: onTap,
      title: CusttonTitleText(
        text: name,
        fontSize: size.width*0.05,
      ),
    );
  }
}
