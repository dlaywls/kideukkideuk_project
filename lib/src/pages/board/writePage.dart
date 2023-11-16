import 'package:flutter/material.dart';

class WritePage extends StatelessWidget {
  WritePage(Null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기 페이지'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
