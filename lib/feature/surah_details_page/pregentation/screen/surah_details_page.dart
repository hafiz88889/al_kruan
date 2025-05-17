import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/text_style.dart';

import '../../../al_kuran/pregentation/screen/api_class.dart';

class SurahDetailsPage extends StatelessWidget {
  final QuranController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final surah = controller.selectedSurah;

    return Scaffold(
      backgroundColor: MyColor.whiteColor,
      appBar: AppBar(
        title: Text(
          surah['name'],
          style: regularTextStyle18.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: MyColor.whiteColor,
        scrolledUnderElevation: 0,
        actions: [Row(
          children: [
            Icon(Icons.filter_list,size: 25,color: MyColor.blackColor,),
            const SizedBox(width: 15,),
            Icon(Icons.bookmark_border,size: 25,color: MyColor.grayColor,),
          ],
        )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(surah['revelationType'],style: regularTextStyle18.copyWith(
            ),
                ),
          //   )
                // Text(
                //   "${ayahs['numberOfAyahs']}",
                //   style: regularTextStyle18.copyWith(
                //     color: MyColor.whiteColor,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: surah['ayahs'].length,
              itemBuilder: (context, index) {
                final ayahs = surah['ayahs'][index];
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: MyColor.grayColor.withAlpha(150)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: MyColor.greenColor,
                            ),
                            child: Text(
                              "${ayahs['number']}",
                              style: regularTextStyle18.copyWith(
                                color: MyColor.whiteColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              ayahs['text'],
                              style: regularTextStyle18,
                              textAlign: TextAlign.right,
        
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Divider(color: MyColor.grayColor.withAlpha(150)),
                      const SizedBox(height: 10,),
        
                    ],
                  ),
                );
                //   title: Text(ayah['text'], textAlign: TextAlign.right),
              },
            ),
          ],
        ),
      ),
    );
  }
}
