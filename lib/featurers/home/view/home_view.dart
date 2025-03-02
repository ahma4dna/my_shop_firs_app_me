import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootAppCubit, RootAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Center(
          child: SwitchListTile(
              value: context.read<RootAppCubit>().getDark,
              onChanged: (value) async {
                await context.read<RootAppCubit>().setTheam(theameValue: value);
              }),
        );
      },
    );
  }
}
