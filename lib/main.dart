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
          cubit.loadTheme();
          return cubit;
        }),
      ],
      child: BlocConsumer<RootAppCubit, RootAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          ThemeMode themeMode = ThemeMode.system;

          return AnimatedTheme(
            duration: Duration(milliseconds: 300),
            data: themeMode == ThemeMode.dark
                ? DarkTheme.themeData(context)
                : LightTheme.themeData(context),
            child: MaterialApp(
              themeMode:
                  context.watch<RootAppCubit>().themeMode == AppThemeMode.dark
                      ? ThemeMode.dark
                      : context.watch<RootAppCubit>().themeMode ==
                              AppThemeMode.light
                          ? ThemeMode.light
                          : ThemeMode.system,
              theme: LightTheme.themeData(context),
              darkTheme: DarkTheme.themeData(context),
              debugShowCheckedModeBanner: false,
              home: Directionality(
                textDirection: TextDirection.rtl,
                child: RootScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
