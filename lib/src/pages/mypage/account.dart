import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  final String edit;

  Account({Key? key, required this.edit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // 배경색을 흰색으로 설정
      child: Center(
        child: Text(
          '안녕~~',
          style: TextStyle(
            fontSize: 20, // 글씨 크기
            color: Colors.black, // 글씨 색상
          ),
        ),
      ),
    );
  }
}
