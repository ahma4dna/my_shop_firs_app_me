import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/compnds/custtom_text_form_feild.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/featurers/auth/cubit/auth_cubit.dart';
import 'package:my_shop/featurers/auth/view/google_botton_signin.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namelcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double withe = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CusttonSubtitleText(text: "الاسم"),
            SizedBox(
              height: withe * 0.02,
            ),
            SizedBox(
              width: withe * 1,
              height: withe * 0.15,
              child: CusttomTextFormFeild(
                controller: namelcontroller,
                hint: "",
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: withe * 0.05,
                  ),
                  child: Icon(IconlyBold.profile),
                ),
              ),
            ),
            SizedBox(
              height: withe * 0.05,
            ),
            CusttonSubtitleText(text: "البريد الالكتروني"),
            SizedBox(
              height: withe * 0.02,
            ),
            SizedBox(
              width: withe * 1,
              height: withe * 0.15,
              child: CusttomTextFormFeild(
                controller: emailcontroller,
                hint: "example@gmail.com",
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: withe * 0.05,
                  ),
                  child: Icon(IconlyBold.message),
                ),
              ),
            ),
            SizedBox(
              height: withe * 0.05,
            ),
            CusttonSubtitleText(text: " كلمة السر"),
            SizedBox(
              height: withe * 0.02,
            ),
            SizedBox(
              width: withe * 1,
              height: withe * 0.15,
              child: CusttomTextFormFeild(
                controller: passwordcontroller,
                hint: "ادخل كلمة السر",
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: withe * 0.05,
                  ),
                  child: Icon(IconlyBold.password),
                ),
              ),
            ),
            SizedBox(
              height: withe * 0.07,
            ),
            Center(
              child: SizedBox(
                width: withe * 0.9,
                height: withe * 0.13,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () async{
                  await  cubit.signUp(
                    name: namelcontroller.text,
                        email: emailcontroller.text,
                        password: passwordcontroller.text);
                  },
                  child: CusttonSubtitleText(
                    text: " التسجبل",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: withe * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: withe * 0.39,
                  child: Divider(
                    color: Colors.grey,
                    height: 1,
                    endIndent: 7,
                  ),
                ),
                CusttonSubtitleText(
                  text: "أو",
                  color: Colors.grey,
                  fontSize: withe * 0.05,
                ),
                SizedBox(
                  width: withe * 0.39,
                  child: Divider(
                    color: Colors.grey,
                    height: 1,
                    indent: 7,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: withe * 0.05,
            ),
            GoogleBottonSignin(),
          ],
        );
      },
    );
  }
}
