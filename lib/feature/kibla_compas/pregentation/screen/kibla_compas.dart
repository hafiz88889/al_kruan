import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:namaz_salat/core/component/global_appbar_widget.dart';
import 'package:namaz_salat/core/utils/myText.dart';
import 'package:namaz_salat/core/utils/my_color.dart';
import 'package:namaz_salat/core/utils/my_image.dart';
import 'package:permission_handler/permission_handler.dart';


class CompassController extends GetxController {
  RxDouble direction = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _requestPermission();
  }

  void _requestPermission() async {
    var status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      FlutterCompass.events!.listen((event) {
        direction.value = event.heading ?? 0;
      });
    }
  }
}

class KiblaCompas extends StatelessWidget {
  final CompassController controller = Get.put(CompassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.whiteColor,
      appBar: globalAppBar(MyText.kivla, MyColor.whiteColor),
      body: Center(
        child: Obx(() {
          return Transform.rotate(
            angle: (controller.direction.value * (3.14159265359 / 180) * -1),
            child: Image(image: AssetImage(MyImage.compass,),width: 300,),
          );
        }),
      ),
    );
  }
}
