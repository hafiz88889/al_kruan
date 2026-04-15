import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiController {
  static Future<Map<String, dynamic>> fetchHijriDate() async {
    final response = await http.get(
      Uri.parse('https://www.habibur.com/hijri/api01/date/?raw=yes'),
    );

    return jsonDecode(response.body);
  }
}
