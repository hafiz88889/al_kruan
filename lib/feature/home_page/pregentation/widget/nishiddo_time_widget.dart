import 'package:flutter/material.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/text_style.dart';

class NishiddoTimeWidget extends StatelessWidget {
  final String text;
  final String time;
  const NishiddoTimeWidget({super.key,required this.text,required this.time});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: regularTextStyle18.copyWith(fontSize: 14,color: MyColor.grayColor),),
        Text(time,style: regularTextStyle18.copyWith(fontSize: 14,color: MyColor.grayColor),),
      ],
    );
  }
}
