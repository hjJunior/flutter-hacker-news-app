import 'package:flutter/material.dart';

class StoryDetail extends StatelessWidget {
  final int storyid;

  StoryDetail({this.storyid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        child: Text('Iam a news detail $storyid'),
      ),
    );
  }
}
