import 'package:flutter/material.dart';
import 'screens/list_stories.dart';

class HackerNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ListStories(),
    );
  }
}