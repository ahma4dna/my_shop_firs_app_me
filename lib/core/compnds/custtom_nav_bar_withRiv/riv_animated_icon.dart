import 'package:flutter/material.dart';
import 'package:my_shop/constant/theam/theame.dart';
import 'package:my_shop/root/cubit/root_app_cubit.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

class CusstomBotNavRivAnimatedIcon extends StatelessWidget {
  const CusstomBotNavRivAnimatedIcon({
    super.key,
    required this.cubit,
  });

  final RootAppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: AppColor.darkCardColor,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppColor.darkCardColor.withOpacity(0.3),
              offset: Offset(0, 20),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(cubit.icon.length, (index) {
            bool isActive = cubit.currentIndex == index;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (cubit.currentIndex == index)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 4,
                    width: 30,
                    margin: EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                Opacity(
                  opacity: isActive?1:0.5,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: RiveAnimatedIcon(
                     
                      riveIcon: cubit.icon[index],
                      color: isActive
                          ? Colors.white
                          : Colors.white,
                      onTap: () {
                        cubit.changeIndex(index);
                        cubit.pageController.jumpToPage(index);
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
