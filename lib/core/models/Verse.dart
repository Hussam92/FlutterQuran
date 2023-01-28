import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:readquran/core/models/chapter.dart';

class Verse {
  final Chapter chapter;
  final int id;
  final int number;
  final int juz_number;
  final String key;
  final int words_count;

  static const PAGE_SIZE = 10;
  static const VERSES_LIST_URL =
      "https://api.quran.com/api/v4/verses/by_chapter/";

  const Verse({
    this.chapter,
      this.id,
      this.number,
      this.juz_number,
      this.key,
      this.words_count
  });

  factory Verse.fromJson(Map<String, dynamic> json, Chapter chapter) {
    return Verse(
      chapter: chapter,
      id: json['id'],
      number: json['number'],
      juz_number: json['juz_number'],
      key: json['key'],
      words_count: json['verses_count'],
    );
  }

  static Future<List<Verse>> fetchVersesList(Chapter chapter, int page, bool withWords) async {
    String url = VERSES_LIST_URL + "${chapter.id}?" + "per_page= ${PAGE_SIZE}" + "&" + "page=${page}" + "&" + "words=${withWords}";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> verseList = jsonDecode(response.body)['verses'];

      return verseList.map((verse) {
        return Verse.fromJson(verse, chapter);
      }).toList();
    } else {

      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load verses');
    }
  }
}
