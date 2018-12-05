import 'package:flutter/material.dart';
import '../blocs/stories_bloc.dart';
import '../blocs/stories_provider.dart';
import '../widgets/story_list_tile.dart';

class ListStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StoriesBloc bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder<List<int>>(
      stream: bloc.topIds,
      builder: (context, snap) {
        if (!snap.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: snap.data.length,
          itemBuilder: (context, index) {
            bloc.fetchItem(snap.data[index]);
            return StoryListTile(itemId: snap.data[index]);
          }
        );
      },
    );
  }
}
