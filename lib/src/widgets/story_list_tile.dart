import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';
import '../blocs/stories_bloc.dart';
import 'loading_container.dart';

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
          return LoadingContainer();
        }
        return FutureBuilder<ItemModel>(
          future: snap.data[itemId],
          builder: (context, itemSnap) {
            if (!itemSnap.hasData) {
              return LoadingContainer();
            }
            return _buildTile(itemSnap.data, context);
          },
        );
      },
    );
  }

  Widget _buildTile(ItemModel item, BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/$itemId');
        },
        title: Text(item.title),
        subtitle: Text("${item.score} votes"),
        trailing: Column(
          children: <Widget>[
            Icon(Icons.comment),
            Text("${item.descendants}")
          ],
        ),
      ),
      Divider(
        height: 8.0,
      )
    ],
  );
}
