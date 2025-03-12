import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/constant/bloc_obsorvr.dart';
import 'package:my_shop/constant/theam/theame.dart';
import 'package:my_shop/featurers/auth/view/auth_view.dart';
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
                child: AuthScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
