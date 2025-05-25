import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:namaz_salat/core/component/global_appbar_widget.dart';
import 'package:namaz_salat/core/utils/myText.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/text_style.dart';

import 'api_class.dart';

class AsmaulHusna extends StatelessWidget {
  const AsmaulHusna({super.key});

  @override
  Widget build(BuildContext context) {
    final NameController controller =Get.put(NameController());
    return  Scaffold(
      backgroundColor: MyColor.whiteColor,
      appBar:globalAppBar(MyText.asmaul_husna, MyColor.whiteColor),
      body: Padding(padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx((){
              if(controller.isLoading.value){
                return Center(child: CircularProgressIndicator());
              }
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.nameList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final asmaulHusna =controller.nameList[index];
                  return  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColor.greenColor)
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColor.greenColor
                          ),
                          child: Text(asmaulHusna.number.toString(),style: regularTextStyle18.copyWith(color: MyColor.whiteColor),),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          children: [
                            Text(asmaulHusna.transliteration,maxLines: 1,overflow:TextOverflow.ellipsis,style: regularTextStyle18,)
                          ],
                        ),
                        const Spacer(),
                        Text(asmaulHusna.name,overflow:TextOverflow.ellipsis,style: regularTextStyle18,)
        
                      ],
                    ),
                  );
                },
                );
              }
            )
        
          ],
        ),
      ),
      ),
    );
  }
}
