import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';
import '../blocs/stories_bloc.dart';

class StoryListTile extends StatelessWidget {
  final int itemId;

  StoryListTile({this.itemId});

  @override
  Widget build(BuildContext context) {
    final StoriesBloc bloc = StoriesProvider.of(context);
    return StreamBuilder<Map<int, Future<ItemModel>>>(
      stream: bloc.items,
      builder: (context, snap) {
        if (!snap.hasData) {
          return Text('Stream still loading');
        }
        return FutureBuilder<ItemModel>(
          future: snap.data[itemId],
          builder: (context, itemSnap) {
            if (!itemSnap.hasData) {
              return Text('Still loading item $itemId}');
            }
            return Text(itemSnap.data.title);
          },
        );
      },
    );
  }
}
