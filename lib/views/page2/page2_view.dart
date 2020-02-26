import 'package:flutter/material.dart';

class Page2View extends StatelessWidget {
  const Page2View({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[400],
      child: Center(
        child: Text('Events View'),
      ),
    );
  }
}