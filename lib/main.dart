import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/constant/theam/theame.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';
import 'package:my_shop/root/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          final cubit = RootAppCubit();
          cubit.getTheam();
          return cubit;
        }),
      ],
      child: BlocConsumer<RootAppCubit, RootAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            theme: Styles.themeData(
              
                isDarkTheme: context.read<RootAppCubit>().getDark,
                context: context),
            debugShowCheckedModeBanner: false,
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: RootScreen(),
            ),
          );
        },
      ),
    );
  }
}
