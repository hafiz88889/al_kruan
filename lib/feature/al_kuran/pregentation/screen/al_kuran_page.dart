import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:namaz_salat/core/component/global_appbar_widget.dart';
import 'package:namaz_salat/core/utils/myText.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/my_image.dart';
import 'package:namaz_salat/core/utils/route.dart';
import 'package:namaz_salat/core/utils/text_style.dart';
import 'api_class.dart';

class AlKuranPage extends StatefulWidget {
  const AlKuranPage({super.key});

  @override
  State<AlKuranPage> createState() => _AlKuranPageState();
}

class _AlKuranPageState extends State<AlKuranPage> {
  @override
  @override
  Widget build(BuildContext context) {
    final QuranController controller = Get.put(QuranController());
    return Scaffold(
      backgroundColor: MyColor.whiteColor,
      appBar: globalAppBar(
        MyText.kuran,
        MyColor.whiteColor,
        Row(
          children: [
            Icon(Icons.filter_list, size: 30),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColor.greenColor,
              ),
              child: Image(
                image: AssetImage(MyImage.arrowIcon),
                height: 20,
                width: 20,
                color: MyColor.whiteColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (controller.surahs.isEmpty) {
                return Center(
                    child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.surahs.length,
                  itemBuilder: (context, index) {
                    final surah = controller.surahs[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: MyColor.greenColor),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColor.greenColor,
                            ),
                            child: Text(
                              "${surah['number']}",
                              style: regularTextStyle18.copyWith(
                                color: MyColor.whiteColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              surah['name'],
                              style: regularTextStyle18.copyWith(fontSize: 16),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.setSurah(surah);
                              Get.toNamed(RouteHelper.surahDetailsPage);
                            },
                            child: Text(
                              "Go",
                              style: regularTextStyle18.copyWith(
                                color: MyColor.whiteColor,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: MyColor.greenColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
