import 'package:flutter/material.dart';
import 'package:readquran/core/models/Verse.dart';

class VerseView extends StatelessWidget {
  final Verse verse;

  VerseView(this.verse);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Card(
            shadowColor: Color.fromARGB(255, 0, 0, 0),
            elevation: 2.0,
            margin: const EdgeInsets.all(6),
            child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 2.0,
                ),
                child: Row(children: [
                  Expanded(
                    flex: 0,
                    child: Icon(
                      Icons.book_rounded,
                      color: Color.fromARGB(255, 68, 127, 255),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        margin: EdgeInsets.only(right: 2, left: 2),
                        child: Text("Verse: " + verse.key)),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                        margin: EdgeInsets.only(right: 2, left: 2),
                        child: Text("Juz: " + "${verse.juz_number}")),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_right, color: Colors.grey))),
                ]))));
  }
}
