import 'package:flutter/material.dart';
import 'screens/list_stories.dart';
import 'blocs/stories_provider.dart';
import 'screens/story_detail.dart';
import 'blocs/comments_provider.dart';

class HackerNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'Hacker News',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
          builder: (context) {
            StoriesProvider.of(context).fetchTopIds();
            return ListStories();
          }
      );
    }
    return MaterialPageRoute(
        builder: (context) {
          final int storyId = int.parse(settings.name.replaceFirst('/', ''));
          CommentsProvider.of(context).fetchItemWithComments(storyId);
          return StoryDetail(storyId: storyId,);
        }
    );

  }
}