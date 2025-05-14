import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/text_style.dart';


class DropdownController extends GetxController {
  final selectVibag = 'ঢাকা'.obs;
  final vibag = ['ঢাকা', 'চট্রগ্রাম', 'রাজশাহী', 'সিলেট'];

  final selectedItemjella = 'নোয়াখালী'.obs;
  final jella = ['ফেনী', 'চট্রগ্রাম', 'নোয়াখালী', 'ফেনি'];
}

class DropDownItem extends StatelessWidget {
  final String? title;
  final Widget? widget;
  const DropDownItem({super.key,
  this.title,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final DropdownController controller = Get.put(DropdownController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(title!, style: regularTextStyle18.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: MyColor.grayColor
          ),),
        const SizedBox(height: 10,),
        Obx(() => Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: MyColor.greenColor),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              icon:widget,
              dropdownColor: MyColor.whiteColor,
              value: controller.selectVibag.value,
              items:
              controller.vibag.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              isExpanded: true,
              onChanged: (newValue) {
                controller.selectVibag.value = newValue!;
              },
            ),
          ),
        ),
        ),
      ],
    );
  }
}


class SelectSwitchItem extends StatelessWidget {
  final String? switchText;
  final String? switchTextItemOne;
  final Widget? widget;
  const SelectSwitchItem({super.key,
  this.switchText,
  this.switchTextItemOne,
  this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(switchText!=null)
        Text(switchText!, style: regularTextStyle18.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: MyColor.grayColor
        ),),
        const SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: MyColor.greenColor),
          ),
          child: Row(
            children: [
              Expanded(
                child:Text(switchTextItemOne!, style: regularTextStyle18.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: MyColor.grayColor
              ),),),
              widget!
            ],
          ),
        ),
      ],
    );
  }
}

