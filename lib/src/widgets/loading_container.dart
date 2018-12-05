import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: _buildContainer(),
          subtitle: _buildContainer(),
        ),
        Divider()
      ],
    );
  }

  Widget _buildContainer() {
    return Container(
      color: Colors.grey[200],
      height: 24.0,
      width: 150.0,
      margin: EdgeInsets.symmetric(vertical: 5.0),
    );
  }
}
