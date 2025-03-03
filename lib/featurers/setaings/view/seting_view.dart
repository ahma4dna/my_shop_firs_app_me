import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';

import '../../../constant/theam/theame.dart';

class SetingView extends StatefulWidget {
  const SetingView({super.key});

  @override
  State<SetingView> createState() => _SetingViewState();
}

class _SetingViewState extends State<SetingView> {
  bool valueBool = false;
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
            child: ListView(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 33,
                      backgroundColor: Color(0xFF1E88E5),
                      child: Icon(
                        IconlyBold.profile,
                        color: Colors.white,
                        size: 33,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CusttonTitleText(
                          text: "الاسم",
                          fontSize: 20,
                        ),
                        CusttonSubtitleText(
                          text: "ahmad@gmail.com",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                CusttonTitleText(
                  text: "عام",
                  fontSize: 25,
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
                          name: 'طلباتي',
                          icone: IconlyBold.buy,
                          onTap: () {},
                        ),
                        Divider(
                          endIndent: 15,
                          indent: 15,
                        ),
                        MyListTile(
                          name: "المفضلة",
                          icone: IconlyBold.heart,
                          onTap: () {},
                        ),
                        Divider(
                          endIndent: 15,
                          indent: 15,
                        ),
                        MyListTile(
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
                  fontSize: 25,
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
                      fontSize: 20,
                    ))
              ],
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
              fontSize: 20,
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
        trailing: Icon(
            cubit.getDark
                ? Icons.radio_button_unchecked
                : Icons.radio_button_checked,
            color: AppColor.darkPrimaryColor),
        onTap: () async {
          if (cubit.getDark == true) {
            setState(() {
              valueBool = !valueBool;
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
        trailing: Icon(
            cubit.getDark
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: AppColor.darkPrimaryColor),
        onTap: () async {
          if (cubit.getDark == false) {
            setState(() {
              valueBool = !valueBool;
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
        size: 25,
      ),
      onTap: onTap,
      title: CusttonTitleText(
        text: name,
        fontSize: 20,
      ),
    );
  }
}
