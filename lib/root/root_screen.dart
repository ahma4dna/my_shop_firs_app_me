import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/constant/appe_color.dart';

import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootAppCubit, RootAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<RootAppCubit>();
        return Scaffold(
          // drawerScrimColor: AppColors.kScaffoldColor,

          body: cubit.pages[cubit.currentIndex],
        
          bottomNavigationBar: NavigationBar(
            selectedIndex: cubit.currentIndex,
            onDestinationSelected: (value) {
              cubit.changeIndex(value);
            },
            destinations: cubit.destinations,
          ),
        );
      },
    );
  }
}
