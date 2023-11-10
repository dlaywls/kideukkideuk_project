import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/pages/writePage.dart';

class SecondPage extends StatelessWidget {
  final String language;

  const SecondPage({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language + " 게시판"), // AppBar에 버튼 텍스트 표시
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () {
            // '글쓰기' 버튼이 눌렸을 때 새로운 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WritePage(null),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF52B160), // 버튼의 배경색
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // 테두리 모서리를 둥글게
            ),
            fixedSize: Size(98, 35.89), // 가로 길이 98, 세로 길이 35.89
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon_write.png', // 이미지 경로 설정
              ),
              SizedBox(width: 4.0), // 이미지와 텍스트 사이의 간격 조절
              Text(
                '글쓰기',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: 13),
      ),
    );
  }
}
