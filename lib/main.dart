import 'dart:async';

import 'package:flutter/material.dart';
import 'package:readquran/widgets/ChapterWidget.dart';
import 'core/models/Chapter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Chapter>> futureChapterList;

  @override
  void initState() {
    super.initState();
    futureChapterList = Chapter.fetchChapterList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
            child: FutureBuilder<List<Chapter>>(
          future: futureChapterList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChapterView(snapshot.data[index]);
                  }
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}'); 
            }

            return const CircularProgressIndicator();
          },
        )),
      ),
    );
  }
}


//ListView.builder(
         // itemCount: futureChapterList.size,
         // itemBuilder: (BuildContext context, int index) {
            // By default, show a loading spinner.
          //  return const CircularProgressIndicator();
          //},
       // )