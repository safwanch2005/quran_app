import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  getDataArabic() async {
    final url = Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani");
    final response = await http.get(url);
    final body = json.decode(response.body);
    final surahsList = body["data"]["surahs"];
    return surahsList;
  }

  getDataEnglish() async {
    final url = Uri.parse("http://api.alquran.cloud/v1/quran/en.asad");
    final response = await http.get(url);
    final body = json.decode(response.body);
    final surahsList = body["data"]["surahs"];
    return surahsList;
  }
}
