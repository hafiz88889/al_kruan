import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namaz_salat/core/utils/myText.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/my_image.dart';
import 'package:namaz_salat/core/utils/route.dart';
import 'package:namaz_salat/feature/home_page/pregentation/widget/nishiddo_time_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/utils/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class CounterController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    count.value++;
    update();
  }

  void decrement() {
    if (count.value > 0) count.value--;
    update();
  }
}

class _HomePageState extends State<HomePage> {
  final CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
   final List<Map<String,dynamic>>item=[
     {"image":MyImage.namaz_TimeICon,"text":MyText.namazsoloycuri},
     {"image":MyImage.khutbaICon,"text":MyText.kuran},
     {"image":MyImage.sahari_iftar,"text":MyText.sahariIftar},
     {"image":MyImage.tasbih,"text":MyText.tasbih},
     {"image":MyImage.compasIcon,"text":MyText.kivla},
     {"image":MyImage.asmaul_husnaIcon,"text":MyText.asmaul_husna},
     {"image":MyImage.khutbaICon,"text":MyText.jummatulKhutbah},
     {"image":MyImage.oaa,"text":MyText.owaj},
     {"image":MyImage.kavaIcon,"text":MyText.live},
   ];
   final List<String>pages=[
     RouteHelper.namazerSomoysuciPage,
     RouteHelper.alKuranPage,
     RouteHelper.sahriIftarPage,
     RouteHelper.tasbih,
     RouteHelper.kiblaCompas,
     RouteHelper.asmaulHusna,
     RouteHelper.jummatulKhutbaPage,
     RouteHelper.oajPage,
     RouteHelper.livePage,
   ];
    return Scaffold(
      backgroundColor: MyColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(MyText.namazTime, style: regularTextStyle18),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.settingPage);
                      },
                      child: Image(
                        image: AssetImage(MyImage.setting),
                        height: 25,
                        width: 25,
                        color: MyColor.grayColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              MyText.dateOne,
                              style: regularTextStyle18.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: (){
                          showDialog(
                            context: context, builder: (context) {
                            return AlertDialog(
                              backgroundColor: MyColor.whiteColor,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(MyText.hijritarikh,style: regularTextStyle18.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),),
                                  const SizedBox(height: 15,),
                                Obx(()=>  Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: MyColor.greenColor)
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: (){
                                              controller.decrement();
                                            }, child: Icon(Icons.remove,size: 20,color: MyColor.greenColor,),
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: Size(50,50),
                                                backgroundColor: MyColor.whiteColor,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                side: BorderSide(
                                                    color: MyColor.greenColor
                                                )
                                            ),
                                          ),
                                          const SizedBox(width: 15,),
                                          Text("${controller.count} দিন",style: regularTextStyle18,),
                                          const SizedBox(width: 15,),
                                          ElevatedButton(
                                            onPressed: (){
                                              controller.increment();
                                            }, child: Icon(Icons.add,size: 20,color: MyColor.greenColor,),
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: Size(50,50),
                                                backgroundColor: MyColor.whiteColor,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                side: BorderSide(
                                                    color: MyColor.greenColor
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 25,),
                                      Center(
                                        child: Text(MyText.ajkertarikh,style: regularTextStyle18.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),),
                                      ),
                                    ],
                                  ),
                                ))
                                ],
                              )
                            );
                          },);
                              },
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MyColor.greenColor.withAlpha(50),
                                ),
                                child: Transform.rotate(
                                  angle: -1,
                                  child: Image(
                                    image: AssetImage(MyImage.arrowIcon),
                                    height: 10,
                                    width: 10,
                                    color: MyColor.greenColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          MyText.dateTwo,
                          style: regularTextStyle18.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.locationDropDown);
                      },
                      child: Container(
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
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColor.greenColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyText.presentOyakto,
                        style: regularTextStyle18.copyWith(
                          color: MyColor.whiteColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyText.Oyakto,
                            style: regularTextStyle18.copyWith(
                              color: MyColor.whiteColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            MyText.to_from_time,
                            style: regularTextStyle18.copyWith(
                              color: MyColor.whiteColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        MyText.bakiSomoy,
                        style: regularTextStyle18.copyWith(
                          color: MyColor.whiteColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      LinearPercentIndicator(
                        animation: true,
                        alignment: MainAxisAlignment.center,
                        padding: const EdgeInsets.all(1),
                        // width: 230.0,
                        lineHeight: 7.0,
                        percent: 0.8,
                        backgroundColor: MyColor.whiteColor.withAlpha(150),
                        progressColor: MyColor.whiteColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: MyColor.greenColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyText.porobartiNamaz,
                        style: regularTextStyle18.copyWith(
                          color: MyColor.grayColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyText.Oyakto,
                            style: regularTextStyle18.copyWith(
                              color: MyColor.grayColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            MyText.to_from_time,
                            style: regularTextStyle18.copyWith(
                              color: MyColor.grayColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyColor.grayColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            MyText.sehereiSes,
                            style: regularTextStyle18.copyWith(
                              color: MyColor.whiteColor,
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),

                          Text(
                            MyText.iftar,
                            style: regularTextStyle18.copyWith(
                              color: MyColor.whiteColor,
                              fontWeight: FontWeight.w100,
                              fontSize: 16
                            ),
                          ),

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            MyText.seheriTime,
                            style: regularTextStyle18.copyWith(
                              color: MyColor.whiteColor,
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            MyText.iftarTime,
                            style: regularTextStyle18.copyWith(
                                color: MyColor.whiteColor,
                                fontWeight: FontWeight.w100,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            MyText.porobortiiftar,
                            style: regularTextStyle18.copyWith(
                              color: MyColor.whiteColor,
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            MyText.porobortiiftartime,
                            style: regularTextStyle18.copyWith(
                                color: MyColor.whiteColor,
                                fontWeight: FontWeight.w100,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: item.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:3,
                  crossAxisSpacing: 20,
                    mainAxisSpacing: 0,
                ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.toNamed(pages[index]);
                        },
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(item[index]["image"],),height: 30,width: 30,color: MyColor.greenColor,),
                            const SizedBox(height: 10,),
                            Text(item[index]["text"],style: regularTextStyle18.copyWith(fontSize: 14),)
                          ],
                        ),
                      );
                    },
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: MyColor.redColor)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(MyText.nisiddotime,style: regularTextStyle18.copyWith(fontSize: 14),)  ,
                       Divider(color:MyColor.grayColor,),
                      const SizedBox(height: 10,),
                      NishiddoTimeWidget(text: MyText.nisiddotimemorning, time: MyText.to_from_time),
                      const SizedBox(height: 10,),
                      NishiddoTimeWidget(text: MyText.nisiddotimenoon, time: MyText.to_from_time),
                      const SizedBox(height: 10,),
                      NishiddoTimeWidget(text: MyText.nisiddotimeafternoon, time: MyText.to_from_time),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyColor.grayColor,
                  ),
                  child:Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyColor.greenColor
                        ),
                        child: Image(image: AssetImage(MyImage.mosque),height: 35,width: 35,color: MyColor.whiteColor,),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                          child:Text(MyText.aboutApp,style: regularTextStyle18.copyWith(fontSize: 14,color: MyColor.whiteColor),
                          ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: MyColor.greenColor
                        ),
                        child: Image(image: AssetImage(MyImage.arrowIcon,),height: 20,width: 20,color: MyColor.whiteColor,),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
