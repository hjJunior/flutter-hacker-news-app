import 'package:flutter/material.dart';
import 'stories_bloc.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  StoriesProvider({Key key, Widget child}) :
    bloc = StoriesBloc(),
    super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static StoriesBloc of(BuildContext context) => (context.inheritFromWidgetOfExactType(StoriesProvider) as StoriesProvider).bloc;
}