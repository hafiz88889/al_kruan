import 'package:flutter/material.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/text_style.dart';

PreferredSizeWidget globalAppBar(String text, Color color,[Widget? action]) {
  return AppBar(
    scrolledUnderElevation: 0,
   // automaticallyImplyLeading: false,
    title: Text(
      text,
      style: regularTextStyle18.copyWith(
        color: MyColor.blackColor,
        fontSize: 20,
      ),
    ),
    actions: action != null ? [action] : [],
    backgroundColor: color,
  );
}
