import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';

class Constant {
  static List<String> images = [
    "https://img.freepik.com/free-psd/flat-design-black-friday-template_23-2149690283.jpg?t=st=1741067825~exp=1741071425~hmac=ee578d9c0a3049a586a3ef81c7c95cd492e6cf8624231d48faa2ee0ceee4b8fa&w=1800",
    "https://img.freepik.com/free-psd/gradient-social-media-giveaway-landing-page_23-2150871663.jpg?t=st=1741067778~exp=1741071378~hmac=64a1e903e33c6eb9289f44854d21558c992a5e960291862690836ecc36d0bb0f&w=1800",
    "https://img.freepik.com/free-vector/electronics-store-template-design_23-2151285501.jpg?t=st=1741067719~exp=1741071319~hmac=2222620820b55d335b058c508ca5b52ff04b51b70a72f41ebe6f91200f237c9a&w=1480",
  ];
}

class CategoryMosel {
  final String text;
  final IconData icon;
  final void Function()? onPressed;

  static List<CategoryMosel> categryModel = [
    CategoryMosel(
      onPressed: () {},
      text: "هواتف",
      icon: Icons.phone_iphone,
    ),
    CategoryMosel(
      onPressed: () {},
      text: "سماعات",
      icon: Icons.headphones,
    ),
    CategoryMosel(
      onPressed: () {},
      text: "قطع الكمبيوتر",
      icon: Icons.desktop_windows_outlined,
    ),
    CategoryMosel(
      onPressed: () {},
      text: "قطع الطاقة",
      icon: Icons.battery_charging_full_sharp,
    ),
    CategoryMosel(
      onPressed: () {},
      text: "شاشات",
      icon: EvaIcons.tv,
    ),
  ];

  static const List<String> caeoryText = [
    "هواتف",
    "سماعات",
    "قطع الكمبيوتر",
    "قطع الطاقة",
    "شاشات",
  ];

  CategoryMosel({
    required this.text,
    required this.icon,
    this.onPressed,
  });
}
