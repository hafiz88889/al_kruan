import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuranController extends GetxController {
  var surahs = [].obs;
  var selectedSurah = {}.obs;

  void setSurah(Map surah) {
    selectedSurah.value = surah;
  }

  @override
  void onInit() {
    super.onInit();
    fetchSurahs();
  }

  void fetchSurahs() async {
    final url = Uri.parse('https://api.alquran.cloud/v1/quran/quran-uthmani');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      surahs.value = data['data']['surahs'];
    }
  }
}
