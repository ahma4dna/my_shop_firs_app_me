import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';

class SetingView extends StatelessWidget {
  const SetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CusttonTitleText(
          text: "الاعدادات",
          fontSize: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            CusttonTitleText(
              text: "عام",
              fontSize: 25,
            ),
            SizedBox(
              height: 8,
            ),
            MyListTile(
              name: 'طلباتي',
              icone: IconlyBold.buy,
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            MyListTile(
              name: 'تمت مشاهدنه مسبقا',
              icone: IconlyBold.time_square,
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            MyListTile(
              name: 'العناوين',
              icone: IconlyBold.location,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.name,
    required this.icone,
    this.onTap,
  });
  final String name;
  final IconData icone;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            width: 1,
            color: context.read<RootAppCubit>().isDark
                ? Colors.white
                : Colors.black),
      ),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        tileColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading: Icon(
          icone,
          size: 25,
        ),
        onTap: onTap,
        title: Center(
          child: CusttonTitleText(
            text: name,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
