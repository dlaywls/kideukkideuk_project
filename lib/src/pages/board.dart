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
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF241701),
            ),
          ).paddingOnly(top: 30, left: 20),
          const Text(
            '각 나라의 언어별로 나누어져 있습니다.',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF505050),
            ),
          ).paddingOnly(top: 10, left: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD2D2D2)), // 테두리 속성
                borderRadius: BorderRadius.circular(10), // 테두리의 모서리를 둥글게
              ),
              margin: const EdgeInsets.all(20), // 테두리 주변의 간격
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('버튼 $index'),
                    onTap: () {
                      // 버튼을 누르면 새로운 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(index),
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
