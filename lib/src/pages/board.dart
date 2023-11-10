import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/pages/boardSecondPage.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '게시판',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF241701),
            ),
          ).paddingOnly(top: 40, left: 30),
          const Text(
            '각 나라의 언어별로 나누어져 있습니다.',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF505050),
            ),
          ).paddingOnly(top: 8, left: 30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD2D2D2)), // 테두리 속성
                borderRadius: BorderRadius.circular(17), // 테두리의 모서리를 둥글게
              ),
              margin: const EdgeInsets.all(20), // 테두리 주변의 간격
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  String language;
                  String hello;
                  switch (index) {
                    case 0:
                      language = '한국어';
                      hello = "안녕하세요";
                      break;
                    case 1:
                      language = '영어';
                      hello = "Hello";
                      break;
                    case 2:
                      language = '일본어';
                      hello = "こんにちは";
                      break;
                    case 3:
                      language = '중국어';
                      hello = "你好。";
                      break;
                    case 4:
                      language = '베트남어';
                      hello = "Xin chào";
                      break;
                    case 5:
                      language = '스페인어';
                      hello = "Hola";
                      break;
                    case 6:
                      language = '러시아어';
                      hello = "Здравствуйте; как поживаете";
                      break;
                    case 7:
                      language = '프랑스어';
                      hello = "Bonjour";
                      break;
                    case 8:
                      language = '독일어';
                      hello = "Guten Tag";
                      break;
                    case 9:
                      language = '아랍어';
                      hello = "نهارك سعيد";
                      break;
                    case 10:
                      language = '터키어';
                      hello = "Gün aydın";
                      break;
                    case 11:
                      language = '말레이어';
                      hello = "Apa Khabar";
                      break;
                    default:
                      language = '기타';
                      hello = "기타";
                  }
                  return ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          language,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF505050),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          hello,
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFFF2A931),
                            fontWeight: FontWeight.bold,
                          ),
                        ).paddingOnly(top: 3),
                      ],
                    ),
                    onTap: () {
                      // 버튼을 누르면 새로운 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(language: language),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
