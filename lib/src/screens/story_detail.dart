import 'package:flutter/material.dart';
import '../blocs/comments_bloc.dart';
import '../blocs/comments_provider.dart';
import '../models/item_model.dart';
import '../widgets/comment.dart';
import '../widgets/loading_container.dart';

class StoryDetail extends StatelessWidget {
  final int storyId;

  StoryDetail({this.storyId});

  @override
  Widget build(BuildContext context) {
    CommentsBloc bloc = CommentsProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body:_buildBody(bloc),
    );
  }

  Widget _buildBody(CommentsBloc bloc) {
    return StreamBuilder<Map<int, Future<ItemModel>>>(
      stream: bloc.itemWithComments,
      builder: (context, snap) {
        if (!snap.hasData) {
          return LoadingContainer();
        }
        final itemFuture = snap.data[storyId];
        return FutureBuilder<ItemModel>(
          future: itemFuture,
          builder: (context, itemSnap) {
            if (!itemSnap.hasData) {
              return LoadingContainer();
            }
            return _buildList(itemSnap.data, snap.data);
          },
        );
      },
    );
  }

  Widget _buildList(ItemModel item, Map<int, Future<ItemModel>> itemMap) {
    final children = <Widget>[_buildTitle(item)];
    final commentsList = item.kids.map((kidId) {
      return Comment(
        itemId: kidId,
        itemMap: itemMap,
        depth: 0,
      );
    }).toList();

    children.addAll(commentsList);

    return ListView(
      children: children,
    );
  }

  Widget _buildTitle(ItemModel item) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(10.0),
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }
}
