import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:namaz_salat/core/utils/myText.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/my_image.dart';
import 'package:namaz_salat/core/utils/route.dart';
import 'package:namaz_salat/feature/setting_page/pregentation/screen/drop_down_item.dart';

import '../../../../core/component/global_appbar_widget.dart';
import '../../../../core/utils/text_style.dart';

class MyPageController extends GetxController {
  final count = 0.obs;
  final countOne = 0.obs;

  void increment() {
    count.value++;
    update();
  }

  void decrement() {
    if (count.value > 0) count.value--;
    update();
  }

  void incrementOne() {
    countOne.value++;
    update();
  }

  void decrementOne() {
    countOne.value--;
    update();
  }

  final switchSelect = false.obs;

  void switchOn(bool val) => switchSelect.value = val;
}

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

final List<Map<String, dynamic>> items = [
  {"oyakto": MyText.fajar},
  {"oyakto": MyText.sunset},
  {"oyakto": MyText.johor},
  {"oyakto": MyText.asor},
  {"oyakto": MyText.sunrise},
  {"oyakto": MyText.magrib},
  {"oyakto": MyText.esha},
];

class _SettingPageState extends State<SettingPage> {
  final MyPageController controller = Get.put(MyPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.whiteColor,
      appBar: globalAppBar(MyText.setting, MyColor.whiteColor),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyText.jellaporiborton,
                style: regularTextStyle18.copyWith(
                  color: MyColor.grayColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyColor.greenColor),
                ),
                child: Row(
                  children: [
                    Text(
                      MyText.bottomanjella,
                      style: regularTextStyle18.copyWith(
                        color: MyColor.grayColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: MyColor.blackColor),
                      ),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(MyImage.locationIcon),
                            height: 15,
                            width: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(MyText.dhaka),
                        ],
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      autofocus: false,
                      onPressed: () {
                        Get.toNamed(RouteHelper.locationDropDown);
                      },
                      child: Text(
                        MyText.poribottontext,
                        style: regularTextStyle18.copyWith(
                          color: MyColor.greenColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                MyText.hijritarikh,
                style: regularTextStyle18.copyWith(
                  color: MyColor.grayColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: MyColor.greenColor),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.decrement();
                            },
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: MyColor.greenColor,
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(50, 50),
                              backgroundColor: MyColor.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: BorderSide(color: MyColor.greenColor),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "${controller.count.value} দিন",
                            style: regularTextStyle18.copyWith(
                              color: MyColor.grayColor,
                            ),
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: () {
                              controller.increment();
                            },
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: MyColor.greenColor,
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(50, 50),
                              backgroundColor: MyColor.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: BorderSide(color: MyColor.greenColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: Text(
                          MyText.ajkertarikh,
                          style: regularTextStyle18.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: MyColor.grayColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                MyText.oyakterSoloy,
                style: regularTextStyle18.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: MyColor.grayColor,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: MyColor.greenColor),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemExtent: 50,
                  itemCount: items.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Row(
                        children: [
                          Expanded(
                            child: Text(
                              items[index]["oyakto"],
                              style: regularTextStyle18.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: MyColor.grayColor,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.decrementOne();
                            },
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: MyColor.greenColor,
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(40, 40),
                              backgroundColor: MyColor.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: BorderSide(color: MyColor.greenColor),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "${controller.countOne.value} মিনিট",
                            style: regularTextStyle18.copyWith(
                              color: MyColor.grayColor,
                            ),
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: () {
                              controller.incrementOne();
                            },
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: MyColor.greenColor,
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(40, 40),
                              backgroundColor: MyColor.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: BorderSide(color: MyColor.greenColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              DropDownItem(
                title: MyText.somoyhisb,
                widget: Icon(Icons.arrow_drop_down),
              ),
              const SizedBox(height: 12),
              DropDownItem(
                title: MyText.majhab,
                widget: Icon(Icons.arrow_drop_down),
              ),
              const SizedBox(height: 12),
              SelectSwitchItem(
                switchText: MyText.tasbihsetting,
                switchTextItemOne: MyText.tasbihsound,
                widget: Obx(
                  () => Switch(
                    activeColor: MyColor.whiteColor,
                    activeTrackColor: MyColor.greenColor,
                    value: controller.switchSelect.value,
                    onChanged: controller.switchOn,
                  ),
                ),
              ),
              SelectSwitchItem(
                switchTextItemOne: MyText.tasbihvibration,
                widget: Obx(
                      () => Switch(
                    activeColor: MyColor.whiteColor,
                    activeTrackColor: MyColor.greenColor,
                    value: controller.switchSelect.value,
                    onChanged: controller.switchOn,
                  ),
                ),
              ),
              const SizedBox(height: 12,),

              SelectSwitchItem(
                switchText: MyText.thekeSetting,
                switchTextItemOne: MyText.darkmode,
                widget: Obx(
                      () => Switch(
                    activeColor: MyColor.whiteColor,
                    activeTrackColor: MyColor.greenColor,
                    value: controller.switchSelect.value,
                    onChanged: controller.switchOn,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
