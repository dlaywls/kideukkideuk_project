import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/pages/logout.dart';
import 'package:kideukkideuk_project/src/pages/mypage/account.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [ 
            const Text(
              '마이 페이지',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF241701),
              ),
            ).paddingOnly(left: 10),
          ]
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 프로필
            Container(
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: BorderRadius.circular(17),
              ),
              margin: const EdgeInsets.only(top: 15, right: 20, left: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: 60, // 이미지의 너비
                    height: 60, // 이미지의 높이
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 처리
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/images/home_logo.png', // 이미지 경로
                        fit: BoxFit.contain, // 이미지가 컨테이너에 어떻게 맞출지 설정
                      ).paddingOnly(left: 13, right: 3),
                    ),
                  ),
              
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 이름
                        const Text(
                          '키득이',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ).paddingOnly(top: 23, left: 15),

                        // 메일 주소
                        const Text(
                          'kideukideuk@gmail.com',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 144, 144, 144),
                            fontWeight: FontWeight.bold,
                          ),
                        ).paddingOnly(top: 10, left: 15),
                      ],
                    ), 
                  )

                ],
              ),
            ),

            // 계정
            Container(
              height: 170,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: BorderRadius.circular(17),
              ),
              margin: const EdgeInsets.only(top: 13, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '계정',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingOnly(top: 15, left: 15),
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 3,
                      itemExtent: 40,
                      itemBuilder: (context, index) {
                        String edit;
                        switch (index) {
                          case 0:
                            edit = '이메일 변경';
                            break;
                          case 1:
                            edit = '닉네임 변경';
                            break;
                          default:
                            edit = '프로필 변경';
                        }
                        return ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                edit,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF505050),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Account(edit: edit),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 앱
            Container(
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: BorderRadius.circular(17),
              ),
              margin: const EdgeInsets.only(top: 13, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '앱',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingOnly(top: 15, left: 15),
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 2,
                      itemExtent: 40,
                      itemBuilder: (context, index) {
                        String edit;
                        switch (index) {
                          case 0:
                            edit = '알림 off';
                            break;
                          default:
                            edit = '저장한 게시물';
                        }
                        return ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                edit,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF505050),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Account(edit: edit),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 이용안내 (비효율적. switch 없애보기)
            Container(
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: BorderRadius.circular(17),
              ),
              margin: const EdgeInsets.only(top: 13, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '이용안내',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingOnly(top: 15, left: 15),
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 1,
                      itemExtent: 40,
                      itemBuilder: (context, index) {
                        String edit;
                        switch (index) {
                          default:
                            edit = '서비스 이용약관';
                        }
                        return ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                edit,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF505050),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Account(edit: edit),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 기타
            Container(
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: BorderRadius.circular(17),
              ),
              margin: const EdgeInsets.only(top: 13, right: 20, left: 20, bottom: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '기타',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingOnly(top: 15, left: 15),
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 2,
                      itemExtent: 40,
                      itemBuilder: (context, index) {
                        String edit;
                        switch (index) {
                          case 0:
                            edit = '탈퇴';
                            break;
                          default:
                            edit = '로그아웃';
                        }
                        return ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                edit,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF505050),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Logout(edit),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

        ],
        ),
      ),
    );
  }
}