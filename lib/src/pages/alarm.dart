import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/pages/board/commentPage.dart';

class Alarm extends StatelessWidget {
  Alarm({Key? key}) : super(key: key);

  // 가상의 데이터 리스트 (제목, 글)
  final List<Map<String, String>> dataList = [
    {'title': '제목1', 'content': '알림 내용1'},
    {'title': '제목2', 'content': '알림 내용2'},
    {'title': '제목3', 'content': '알림 내용3'},
    // 필요에 따라 더 많은 데이터 추가 가능
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '알림',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF241701),
            ),
          ).paddingOnly(top: 40, left: 30),
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
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          backgroundImage: const AssetImage(
                              'assets/images/icon_commnet_notification.png'),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black, // 테두리 색상
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFFD4D4D4), // 테두리 색상
                                width: 1.0, // 테두리 두께
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          dataList[index]['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF170F01),
                          ),
                        ),
                        subtitle: Text(
                          dataList[index]['content'] ?? '',
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF170F01),
                          ),
                        ),

                        // 각 항목을 눌렀을 때 해당 항목의 세부 페이지로 이동
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentPage(
                                title: dataList[index]['title'] ?? '',
                                content: dataList[index]['content'] ?? '',
                                language: "한국어",
                                likeCount: 0,
                                commentCount: 0,
                              ),
                            ),
                          );
                        },
                      ),
                      // 구분선 추가
                    ],
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
