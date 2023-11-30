import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/pages/board/postPage.dart';

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
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF241701),
            ),
          ).paddingOnly(top: 50, left: 30),
          const Text(
            '각 나라의 언어별로 나누어져 있습니다.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF505050),
            ),
          ).paddingOnly(top: 4, left: 30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)), // 테두리 속성
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(17),
                    topRight: Radius.circular(17)), // 테두리의 모서리를 둥글게
              ),
              margin: const EdgeInsets.only(
                  top: 20, right: 20, left: 20), // 테두리 주변의 간격
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  String language;
                  String hello;
                  int id;
                  switch (index) {
                    case 0:
                      language = '한국어';
                      hello = "안녕하세요";
                      id = index;
                      break;
                    case 1:
                      language = '영어';
                      hello = "Hello";
                      id = index;
                      break;
                    case 2:
                      language = '일본어';
                      hello = "こんにちは";
                      id = index;
                      break;
                    case 3:
                      language = '중국어';
                      hello = "你好。";
                      id = index;
                      break;
                    case 4:
                      language = '베트남어';
                      hello = "Xin chào";
                      id = index;
                      break;
                    case 5:
                      language = '스페인어';
                      hello = "Hola";
                      id = index;
                      break;
                    case 6:
                      language = '러시아어';
                      hello = "Здравствуйте; как поживаете";
                      id = index;
                      break;
                    case 7:
                      language = '프랑스어';
                      hello = "Bonjour";
                      id = index;
                      break;
                    case 8:
                      language = '독일어';
                      hello = "Guten Tag";
                      id = index;
                      break;
                    case 9:
                      language = '아랍어';
                      hello = "نهارك سعيد";
                      id = index;
                      break;
                    case 10:
                      language = '터키어';
                      hello = "Gün aydın";
                      id = index;
                      break;
                    case 11:
                      language = '말레이어';
                      hello = "Apa Khabar";
                      id = index;
                      break;
                    default:
                      language = '기타';
                      hello = "기타";
                      id = 12;
                  }
                  return ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          language,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF505050),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          hello,
                          style: const TextStyle(
                            fontSize: 12,
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
                          builder: (context) =>
                              PostView(language: language, id: id),
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
