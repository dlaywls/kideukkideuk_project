import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final int buttonIndex;

  SecondPage(this.buttonIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('두 번째 페이지'),
      ),
      body: Center(
        child: Text('눌린 버튼: $buttonIndex'),
      ),
    );
  }
}
