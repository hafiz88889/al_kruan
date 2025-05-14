import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namaz_salat/core/utils/myText.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/text_style.dart';
import 'package:namaz_salat/feature/setting_page/pregentation/screen/drop_down_item.dart';

import '../../../../core/component/global_appbar_widget.dart';
import '../../../setting_page/pregentation/screen/drop_down_item.dart';

class LocationDropDown extends StatefulWidget {
  const LocationDropDown({super.key});

  @override
  State<LocationDropDown> createState() => _LocationDropDownState();
}

class _LocationDropDownState extends State<LocationDropDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.whiteColor,
      appBar:globalAppBar(MyText.jellaporiborton,MyColor.whiteColor),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            DropDownItem(
              title: MyText.vivagnirbacon,
              widget: Icon(Icons.arrow_drop_down),
            ),
            const SizedBox(height: 12,),
            DropDownItem(
              title: MyText.jellanirbacon,
              widget: Icon(Icons.arrow_drop_down),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  MyText.poribottontext,
                  style: regularTextStyle18.copyWith(
                    color: MyColor.whiteColor,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColor.greenColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
