import 'package:flutter/material.dart';
import 'package:namaz_salat/core/utils/myText.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/text_style.dart';

import '../../../../core/component/global_appbar_widget.dart';
import '../../../../core/utils/my_image.dart';

class NamazerSomoysuciPage extends StatelessWidget {
  const NamazerSomoysuciPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"oyakto": MyText.tahajjod,"time":MyText.to_from_time},
      {"oyakto": MyText.fajar,"time":MyText.to_from_time},
      {"oyakto": MyText.sunset,"time":MyText.to_from_time},
      {"oyakto": MyText.johor,"time":MyText.to_from_time},
      {"oyakto": MyText.asor,"time":MyText.to_from_time},
      {"oyakto": MyText.sunrise,"time":MyText.to_from_time},
      {"oyakto": MyText.magrib,"time":MyText.to_from_time},
      {"oyakto": MyText.esha,"time":MyText.to_from_time},
    ];
    return Scaffold(
      backgroundColor: MyColor.whiteColor,
      appBar: globalAppBar(
        MyText.oyaktoBittiktime,
        MyColor.whiteColor,
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: MyColor.greenColor, width: 1.5),
          ),
          child: Row(
            children: [
              Image(
                image: AssetImage(MyImage.locationIcon),
                height: 15,
                width: 15,
                color: MyColor.blackColor,
              ),
              const SizedBox(width: 5),
              Text(MyText.dhaka),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyColor.blackColor,
                  ),
                  child: Text(
                    MyText.today,
                    style: regularTextStyle18.copyWith(color: MyColor.whiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: MyColor.greenColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            items[index]["oyakto"],
                            style: regularTextStyle18.copyWith(
                              fontSize: 16,
                              color: MyColor.grayColor,
                            ),
                          ),
                        ),
                        Text(
                          items[index]["time"],
                          style: regularTextStyle18.copyWith(
                            fontSize: 16,
                            color: MyColor.grayColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
