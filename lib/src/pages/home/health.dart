import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Health extends StatelessWidget {
  const Health ({Key? key}) : super (key: key);
  
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          children: [
            SizedBox(
              width: 30, // 이미지의 너비
              height: 30, // 이미지의 높이
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 처리
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/home_logo.png', // 이미지 경로
                fit: BoxFit.contain, // 이미지가 컨테이너에 어떻게 맞출지 설정
                ),
              ).paddingOnly(left: 2),
            ),
          ]
        ),
      ),
    );
  }
}