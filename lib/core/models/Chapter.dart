import 'dart:convert';
import 'package:http/http.dart' as http;

class Chapter {
  final int id;
  final String name_en;
  final String name_ar;
  final int verses_count;

  static const CHAPTERS_URL = "https://api.quran.com/api/v4/chapters?language=en";

  const Chapter({this.id, this.name_en, this.name_ar, this.verses_count});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'],
      name_en: json['name_simple'],
      name_ar: json['name_arabic'],
      verses_count: json['verses_count'],
    );
  }

  static Future<List<Chapter>> fetchChapterList() async {
    final response = await http.get(Uri.parse(CHAPTERS_URL));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> chapterList = jsonDecode(response.body)['chapters'];
      return chapterList.map((chapter) {
        return Chapter.fromJson(chapter);
      }).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load chapter');
    }
  }
}
