import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritePage extends StatelessWidget {
  WritePage(Null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('글쓰기 페이지'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: '글을 적어주세요',
            ),
          ),
        ),
      ),
    );
  }
}
