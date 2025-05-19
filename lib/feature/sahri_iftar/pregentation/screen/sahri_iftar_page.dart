import 'package:flutter/material.dart';
import 'package:namaz_salat/core/component/global_appbar_widget.dart';
import 'package:namaz_salat/core/utils/myText.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/my_image.dart';
import 'package:namaz_salat/core/utils/text_style.dart';

class SahriIftarPage extends StatelessWidget {
  const SahriIftarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> item = [
      {
        "slNo": "1",
        "days": MyText.saturday,
        "date": MyText.sharidate,
        "sehrises": MyText.sehereiSes,
        "seheritime": MyText.seheriTime,
        "ifter": MyText.iftar,
        "iftartime": MyText.iftarTime,
      },
      {
        "slNo": "2",
        "days": MyText.sunday,
        "date": MyText.sharidate,
        "sehrises": MyText.sehereiSes,
        "seheritime": MyText.seheriTime,
        "ifter": MyText.iftar,
        "iftartime": MyText.iftarTime,
      },
      {
        "slNo": "3",
        "days": MyText.monday,
        "date": MyText.sharidate,
        "sehrises": MyText.sehereiSes,
        "seheritime": MyText.seheriTime,
        "ifter": MyText.iftar,
        "iftartime": MyText.iftarTime,
      },
      {
        "slNo": "4",
        "days": MyText.tuesday,
        "date": MyText.sharidate,
        "sehrises": MyText.sehereiSes,
        "seheritime": MyText.seheriTime,
        "ifter": MyText.iftar,
        "iftartime": MyText.iftarTime,
      },
      {
        "slNo": "5",
        "days": MyText.wednesday,
        "date": MyText.sharidate,
        "sehrises": MyText.sehereiSes,
        "seheritime": MyText.seheriTime,
        "ifter": MyText.iftar,
        "iftartime": MyText.iftarTime,
      },
      {
        "slNo": "6",
        "days": MyText.thursday,
        "date": MyText.sharidate,
        "sehrises": MyText.sehereiSes,
        "seheritime": MyText.seheriTime,
        "ifter": MyText.iftar,
        "iftartime": MyText.iftarTime,
      },
      {
        "slNo": "7",
        "days": MyText.friday,
        "date": MyText.sharidate,
        "sehrises": MyText.sehereiSes,
        "seheritime": MyText.seheriTime,
        "ifter": MyText.iftar,
        "iftartime": MyText.iftarTime,
      },

    ];
    return Scaffold(
      backgroundColor: MyColor.whiteColor,
      appBar: globalAppBar(
        MyText.sahariIftar,
        MyColor.whiteColor,
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: MyColor.blackColor),
          ),
          child: Row(
            children: [
              Image(
                image: AssetImage(MyImage.locationIcon),
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 10),
              Text(
                MyText.dhaka,
                style: regularTextStyle18.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: MyColor.greenColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColor.greenColor,
                          ),
                          child: Text(
                            item[index]["slNo"],
                            style: regularTextStyle18.copyWith(
                              color: MyColor.whiteColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          children: [
                            Text(
                              item[index]["days"],
                              style: regularTextStyle18.copyWith(fontSize: 14),
                            ),
                            Text(
                              item[index]["date"],
                              style: regularTextStyle18.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              item[index]["sehrises"],
                              style: regularTextStyle18.copyWith(fontSize: 14),
                            ),
                            Text(
                              item[index]["seheritime"],
                              style: regularTextStyle18.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              item[index]["ifter"],
                              style: regularTextStyle18.copyWith(fontSize: 14),
                            ),
                            Text(
                              item[index]["iftartime"],
                              style: regularTextStyle18.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
