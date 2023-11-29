/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/pages/mypage/account.dart';

class Inform extends StatelessWidget {
  const Inform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '정보 링크',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF241701),
              ),
            ).paddingOnly(top: 40, left: 30),
            const Text(
              '유명한 정보를 제공하는 사이트들이 모여있습니다.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF505050),
              ),
            ).paddingOnly(top: 8, left: 30, bottom: 20),


          ],
        ),
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/pages/mypage/account.dart';

class Inform extends StatelessWidget {
  const Inform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          elevation: 0,
        title: ListTile(
          title: const Text(
            '정보 링크',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF241701),
            ),
          ).paddingOnly(top:15),
          
          subtitle: const Text(
            '유용한 정보를 제공하는 링크들이 모여있습니다.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF505050),
            ),
          ).paddingOnly(top: 9),
        ),
      ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 찾기 쉬운 생활 법령 정보
            Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: BorderRadius.circular(17),
              ),
              margin: const EdgeInsets.only(top: 13, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '찾기 쉬운 생활 법령 정보',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingOnly(top: 15, left: 15, bottom: 12),
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        String edit;
                        switch (index) {
                          default:
                            edit = '다양한 언어 제공\n\n카드뉴스 형식으로 보기 쉽게 제공';
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
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 하이코리아
            Container(
              height: 110,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: BorderRadius.circular(17),
              ),
              margin: const EdgeInsets.only(top: 13, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '하이코리아',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingOnly(top: 15, left: 15, bottom: 7),
                  
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        String edit;
                        switch (index) {
                          default:
                            edit = '외국인의 투자, 취업, 거주 정보를 제공\n\n(한국어, 영어, 중국어 지원)';
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
                              ).paddingOnly(top: 5),
                            ],
                          ),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 서울 외국인 포털
            Container(
              height: 160,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: BorderRadius.circular(17),
              ),
              margin: const EdgeInsets.only(top: 13, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '서울 외국인 포털',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingOnly(top: 15, left: 15, bottom: 5),
                  
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        String edit;
                        switch (index) {
                          default:
                            edit = '●\t\t다국어 생활 상담\n●\t\t교육, 문화 등 다양한 프로그램 제공\n●\t\t서울에 거주하는 외국인을 위한 서울 생활에 '
                             '\n\t\t\t\t\t\t대한 조언 \n\n(한국어, 영어, 중국어 지원)';
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
                              ).paddingOnly(top: 5),
                            ],
                          ),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 세종학당재단
            Container(
              height: 110,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: BorderRadius.circular(17),
              ),
              margin: const EdgeInsets.only(top: 13, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '세종학당재단',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingOnly(top: 15, left: 15, bottom: 8),
                  
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        String edit;
                        switch (index) {
                          default:
                            edit = '한국어와 한국 문화 교육 프로그램 제공\n\n(한국어, 영어, 중국어 지원)';
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
                              ).paddingOnly(top: 5),
                            ],
                          ),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 다누리포털
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: BorderRadius.circular(17),
              ),
              margin: const EdgeInsets.only(top: 13, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '다누리포털',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingOnly(top: 15, left: 15, bottom: 8),
                  
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        String edit;
                        switch (index) {
                          default:
                            edit = '●\t\t한국 생활 정보, 온라인 상담, 온라인 교육 제공\n'
                             '●\t\t다문화 가정이 한국에서 지원과 보살핌을'
                             '\n\t\t\t\t\t\t받으며 생활할 수 있도록 도와줌\n\n(13개국어 지원)';
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
                              ).paddingOnly(top: 5),
                            ],
                          ),
                          onTap: () {},
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


