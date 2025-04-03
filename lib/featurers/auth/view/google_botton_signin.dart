import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/compnds/text/custton_subtitle_text.dart';
import 'package:my_shop/featurers/auth/cubit/auth_cubit.dart';

class GoogleBottonSignin extends StatelessWidget {
  const GoogleBottonSignin({super.key});

  @override
  Widget build(BuildContext context) {
    double withe = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: withe * 0.9,
        height: withe * 0.13,
        child: ElevatedButton.icon(
          icon: Image.asset("images/assets/icons8-google-48.png",
              width: withe * 0.1, height: withe * 0.15),
          iconAlignment: IconAlignment.end,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 5,
          ),
          onPressed: () async {
            await context
                .read<AuthCubit>()
                .loginWithGoogleProvder(context: context);
          },
          label: CusttonSubtitleText(
            text: "التسجيل بواسطة جوجل",
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
