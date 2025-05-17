import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PrayerTimeController extends GetxController {
  var fajr = ''.obs;
  var Sunrise = ''.obs;
  var Sunset = ''.obs;
  var dhuhr = ''.obs;
  var asr = ''.obs;
  var maghrib = ''.obs;
  var isha = ''.obs;
  var readable = ''.obs;

  Future<void> fetchPrayerTimes() async {
    Uri url = Uri.parse("https://api.aladhan.com/v1/timingsByAddress?address=Dubai,UAE&method=8");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var timings = data['data']['timings'];
      fajr.value = timings['Fajr'];
      Sunrise.value = timings['Fajr'];
      Sunset.value = timings['Fajr'];
      dhuhr.value = timings['Dhuhr'];
      asr.value = timings['Asr'];
      maghrib.value = timings['Maghrib'];
      isha.value = timings['Isha'];

      var dateing = data['data']['date'];
      readable.value = dateing['dateing'];

    } else {
      print("Failed to load prayer times");
    }
  }

  @override
  void onInit() {
    fetchPrayerTimes();
    super.onInit();
  }
}
