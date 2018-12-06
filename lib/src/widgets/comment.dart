import 'package:flutter/material.dart';
import 'dart:async';
import '../models/item_model.dart';
import 'loading_container.dart';

class Comment extends StatelessWidget {
  final int depth;
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;

  Comment({this.itemId, this.itemMap, this.depth});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemModel>(
      future: itemMap[itemId],
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        final children = <Widget>[
          ListTile(
            title: _buildText(snapshot.data),
            subtitle: snapshot.data.by == "" ? Text('Deleted') : Text(snapshot.data.by) ,
            contentPadding: EdgeInsets.only(right: 16.0, left: (depth + 1) * 16.0),
          ),
          Divider()
        ];

        snapshot.data.kids.forEach((kidId) {
          children.add(Comment(
            itemId: kidId,
            itemMap: itemMap,
            depth: depth + 1,
          ));
        });

        return Column(
          children: children,
        );
      },
    );
  }

  Widget _buildText(ItemModel item) {
    final text = item.text
      .replaceAll('&#x27;', "'")
      .replaceAll('<p>', "\n\n")
      .replaceAll('</p>', "");

    return Text(text);
  }
}
