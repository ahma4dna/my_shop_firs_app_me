import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/featurers/auth/cubit/auth_cubit.dart';
import 'package:my_shop/featurers/auth/view/login_form.dart';
import 'package:my_shop/featurers/auth/view/sign_up_form.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';
import 'package:my_shop/root/root_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedTab = 0; // 0 = Login, 1 = SignUp

  @override
  Widget build(BuildContext context) {
    double withe = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
      if (state is LoginGoogleSucces || state is LoginSucces || state is SignUpSucces) {
    

          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RootScreen()),
            );
          });
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Skeletonizer(
                  enabled: state is SignUpLoading ||
                      state is LoginGoogleLoading ||
                      state is LoginLoading,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: withe * 0.07,
                      ),
                      Text(
                        "متجري",
                        style: TextStyle(
                          fontSize: withe * 0.085,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      SizedBox(
                        height: withe * 0.085,
                      ),

                      // Tabs (Login / Sign Up)
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => selectedTab = 0),
                            child: Column(
                              children: [
                                Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                    fontSize: withe * 0.05,
                                    color: Theme.of(context).iconTheme.color,
                                    fontWeight: selectedTab == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                if (selectedTab == 0)
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    height: 2,
                                    width: withe * 0.25,
                                    color: Theme.of(context).primaryColor,
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: withe * 0.05,
                          ),
                          GestureDetector(
                            onTap: () => setState(() => selectedTab = 1),
                            child: Column(
                              children: [
                                Text(
                                  "التسجيل",
                                  style: TextStyle(
                                    fontSize: withe * 0.05,
                                    color: Theme.of(context).iconTheme.color,
                                    fontWeight: selectedTab == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                if (selectedTab == 1)
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    height: 2,
                                    width: withe * 0.15,
                                    color: Theme.of(context).primaryColor,
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: withe * 0.085,
                      ),

                      // Page Content
                      IndexedStack(
                        index: selectedTab,
                        children: [
                          LoginForm(),
                          SignUpForm(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: Colors.blue,
    ));
  }
}

// Login Form Placeholder

// Sign Up Form Placeholder
