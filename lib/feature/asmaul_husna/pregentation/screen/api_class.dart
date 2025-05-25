// controllers/name_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model_class.dart';

class NameController extends GetxController {
  var nameList = <AllahName>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNames();
    super.onInit();
  }

  void fetchNames() async {
    final url = Uri.parse("https://api.aladhan.com/v1/asmaAlHusna"); // Update with real API

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body)["data"];
        nameList.value = List<AllahName>.from(data.map((e) => AllahName.fromJson(e)));
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch names");
    } finally {
      isLoading.value = false;
    }
  }
}
