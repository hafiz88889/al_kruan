import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namaz_salat/core/component/global_appbar_widget.dart';
import 'package:namaz_salat/core/utils/myText.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/text_style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DuaContent {
  final String arabicText;
  final String transliteration;
  final String banglaMeaning;

  DuaContent({
    required this.arabicText,
    required this.transliteration,
    required this.banglaMeaning,
  });
}

class TasbihController extends GetxController {
  final List<DuaContent> _duaList = [
    DuaContent(
      arabicText: MyText.laElaha,
      transliteration: MyText.laElahaBangla,
      banglaMeaning: MyText.laElahaBanglaottho,
    ),
    DuaContent(
      arabicText: 'سُبْحَانَ ٱللَّٰهِ',
      transliteration: 'সুবহানাল্লাহ',
      banglaMeaning: 'আল্লাহ পবিত্র',
    ),
    DuaContent(
      arabicText: 'اَلْحَمْدُ لِلَّٰهِ',
      transliteration: 'আলহামদুলিল্লাহ',
      banglaMeaning: 'সকল প্রশংসা আল্লাহর',
    ),
    // Add more DuaContent objects as needed
  ];
  final _currentIndex = 0.obs;
  DuaContent get currentDua => _duaList[_currentIndex.value];
  int get currentIndex => _currentIndex.value;
  void nextDua() {
    if (_currentIndex.value < _duaList.length - 1) {
      _currentIndex.value++;
    } else {
      // Loop back to the first Dua if at the end
      _currentIndex.value = 0;
    }
  }

  // Method to move to the previous Dua (optional, but good for navigation)
  void previousDua() {
    if (_currentIndex.value > 0) {
      _currentIndex.value--;
    } else {
      // Loop to the last Dua if at the beginning
      _currentIndex.value = _duaList.length - 1;
    }
  }

  final count = 0.obs;
  final count2=0.obs;
  final int maxCount = 33;

  double get percentage => count.value / maxCount;

  void increment() async {
    if (count.value >= maxCount) {
      count.value = 0;
      count2.value++;
    } else {
      count.value++;
      count2.value++;
    }
  }

  void reset() {
    count.value = 0;
  }
}

class Tasbih extends StatelessWidget {
  const Tasbih({super.key});

  @override
  Widget build(BuildContext context) {
    final TasbihController controller = Get.put(TasbihController());
    return Scaffold(
      appBar: globalAppBar(
        MyText.tasbih,
        MyColor.whiteColor,
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.refresh, size: 25, color: MyColor.grayColor),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.vibration, size: 25, color: MyColor.grayColor),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.volume_down, size: 25, color: MyColor.grayColor),
            ),
          ],
        ),
      ),

      backgroundColor: MyColor.whiteColor,
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
           Obx(()=> Container(
             alignment: Alignment.center,
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               border: Border.all(color: MyColor.greenColor),
             ),
             child: Column(
               children: [
                 Text(
                   controller.currentDua.arabicText,
                   style: regularTextStyle18.copyWith(
                     color: MyColor.grayColor,
                   ),
                 ),
                 const SizedBox(height: 20),
                 Text(
                   controller.currentDua.transliteration,
                   style: regularTextStyle18.copyWith(
                     color: MyColor.grayColor,
                   ),
                 ),
                 const SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     GestureDetector(
                       onTap: controller.previousDua, // Call nextDua on tap
                       child: Icon(
                         Icons.arrow_back_ios, // Right arrow icon
                         color: Colors.teal,
                         size: 28,
                       ),
                     ),
                     Text(
                       controller.currentDua.banglaMeaning,
                       style: regularTextStyle18.copyWith(
                         color: MyColor.grayColor,
                       ),
                     ),
                     GestureDetector(
                       onTap: controller.nextDua, // Call nextDua on tap
                       child: Icon(
                         Icons.arrow_forward_ios, // Right arrow icon
                         color: Colors.teal,
                         size: 28,
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(height: 20),
                 Obx(()=>Text(
                   "${MyText.porahoyece} ${controller.count} ${MyText.bar}",
                   style: regularTextStyle18.copyWith(
                     color: MyColor.greenColor,
                   ),
                 ),),
                 const SizedBox(height: 50),
               ],
             ),
           ),),
            const SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColor.grayColor.withAlpha(50),
              ),
              child: Obx(
                () => Text(
                  "${MyText.total} ${controller.count2.value}",
                  style: regularTextStyle18.copyWith(color: MyColor.grayColor),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            GestureDetector(
              onTap: controller.increment,
              child: Obx(() => CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 13.0,
                animation: true,
                percent: controller.percentage,
                center: Text(
                  '${controller.count.value}',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.teal,
                backgroundColor: Colors.grey.shade300,
              )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
