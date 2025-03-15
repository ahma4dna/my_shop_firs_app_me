import 'package:flutter/material.dart';
import 'package:my_shop/constant/appe_color.dart';
import 'package:my_shop/core/text/custon_text_button.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/auth/cubit/auth_cubit.dart';
import 'package:my_shop/featurers/auth/view/auth_view.dart';

Future<dynamic> showDilogOkOrCncel({
  required BuildContext context,
  required String textWr,
  required bool isErorr,
  required Function fctOk,
  AuthState? state,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return state is SignOutLoading
          ? Loading()
          : AlertDialog(
              backgroundColor: AppColors.kGreyColor,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  CusttonTitleText(
                    text: textWr,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: isErorr,
                        child: CustonTextButton(
                          text: "لا",
                          function: () {
                            Navigator.pop(context);
                          },
                          color: Colors.red,
                        ),
                      ),
                      CustonTextButton(
                        text: "نعم",
                        function: () {
                          fctOk();
                        },
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            );
    },
  );
}
