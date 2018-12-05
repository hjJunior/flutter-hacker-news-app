import 'package:flutter/material.dart';
import 'screens/list_stories.dart';
import 'blocs/stories_provider.dart';

class HackerNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Hacker News',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: ListStories(),
      ),
    );
  }
}