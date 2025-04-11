// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shop/constant/bloc_obsorvr.dart';
import 'package:my_shop/constant/theam/theame.dart';
import 'package:my_shop/featurers/auth/cubit/auth_cubit.dart';
import 'package:my_shop/featurers/auth/view/auth_view.dart';
import 'package:my_shop/featurers/cart/cubit/cart_cubit.dart';
import 'package:my_shop/featurers/inner_feature/recently/cubit/recently_cubit.dart';
import 'package:my_shop/featurers/product/cubit/product_cubit.dart';
import 'package:my_shop/featurers/search/cubit/search_cubit.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';
import 'package:my_shop/root/root_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Supabase.initialize(
    url: 'https://xwmjbkvshvoojtwaxklj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh3bWpia3ZzaHZvb2p0d2F4a2xqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE3ODE4MDQsImV4cCI6MjA1NzM1NzgwNH0.UaajTcSoXHSoFaZUB5I9T8LMyIwtrYWYhRJYcp57GHA',
  );
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return ProductCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return RootAppCubit()..loadTheme();
          },
        ),
        BlocProvider(
          create: (context) {
            return AuthCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return CartCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return RecentlyCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return SearchCubit();
          },
        ),
          BlocProvider(
          create: (context) {
            return AuthCubit();
          },
        ),
      ],
      child: BlocConsumer<RootAppCubit, RootAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          User? user = Supabase.instance.client.auth.currentUser;
          ThemeMode themeMode = ThemeMode.system;

          return AnimatedTheme(
            duration: Duration(
              milliseconds: 300,
            ),
            data: themeMode == ThemeMode.dark
                ? DarkTheme.themeData(context)
                : LightTheme.themeData(context),
            child: ScreenUtilInit(
              designSize: const Size(1220, 2712), 
              minTextAdapt: true,
              splitScreenMode: true,
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
                home: user != null
                    ? Directionality(
                        textDirection: TextDirection.rtl,
                        child: RootScreen(),
                      )
                    : Directionality(
                        textDirection: TextDirection.rtl,
                        child: AuthScreen(),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}


