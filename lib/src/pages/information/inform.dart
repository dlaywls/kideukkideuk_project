import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
            ).paddingOnly(top: 46, left: 30),
            const Text(
              '유용한 정보를 제공하는 사이트들이 모여있습니다.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF505050),
              ),
            ).paddingOnly(top: 4, left: 30),

            // 찾기 쉬운 생활 법령 정보
            Container(
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                ),
                border: Border.all(color: const Color(0xFFD2D2D2)),
              ),
              margin: const EdgeInsets.only(top: 26, right: 20, left: 20),
              padding: const EdgeInsets.only(top: 0, left: 26, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/icon_link_1.png', // 이미지 경로 설정
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                          width: 8), // Add some space between image and text
                      const Text(
                        '찾기 쉬운 생활 법령 정보',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF170F01),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      const url =
                          'https://easylaw.go.kr/CSP/CnpClsMain.laf?csmSeq=508&ccfNo=3&cciNo=7&cnpClsNo=1';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('링크 안넘어가짐');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF52B160),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      fixedSize: const Size(65, 10),
                    ),
                    child: const Text(
                      '바로가기',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ).marginZero,
                  ).marginOnly(right: 13),
                ],
              ),
            ),

            Container(
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                ),
              ),
              margin: const EdgeInsets.only(top: 0, right: 20, left: 20),
              padding: const EdgeInsets.only(top: 10, left: 28, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '다양한 언어 제공',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF505050),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/arrow_button.png', // 이미지 경로 설정
                          height: 16,
                          width: 16,
                        ),
                        onPressed: () async {
                          const url =
                              'https://easylaw.go.kr/CSM/EasyCardSubMain.laf';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print('링크 안넘어가짐');
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '카드뉴스 형식으로 보기 쉽게 제공',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF505050),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/arrow_button.png',
                          height: 16,
                          width: 16, // 이미지 경로 설정
                        ),
                        onPressed: () async {
                          const url =
                              'https://easylaw.go.kr/CSP/CsmSortRetrieveLst.laf?sortType=easy&search_put=';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print('링크 안넘어가짐');
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                ),
              ),
              margin: const EdgeInsets.only(top: 24, right: 20, left: 20),
              padding: const EdgeInsets.only(top: 0, left: 26, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/icon_link_2.png', // 이미지 경로 설정
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '하이코리아',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF170F01),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      const url = 'https://www.hikorea.go.kr/Main.pt';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('링크 안넘어가짐');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF52B160), // 버튼의 배경색
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // 테두리 모서리를 둥글게
                      ),
                      fixedSize: const Size(65, 10), // 가로 길이 98, 세로 길이 35.89
                    ),
                    child: const Text(
                      '바로가기',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ).paddingZero,
                  ).marginOnly(right: 13),
                ],
              ),
            ),

            Container(
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                ),
              ),
              margin: const EdgeInsets.only(top: 0, right: 20, left: 20),
              padding: const EdgeInsets.only(top: 26, left: 28, bottom: 22),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '외국인의 투자, 취업, 거주 정보를 제공',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '(한국어, 영어, 중국어 지원)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            //서울 외국인 포털
            Container(
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                ),
              ),
              margin: const EdgeInsets.only(top: 24, right: 20, left: 20),
              padding: const EdgeInsets.only(top: 0, left: 26, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/icon_link_3.png', // 이미지 경로 설정
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '서울 외국인 포털',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF170F01),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      const url = 'https://global.seoul.go.kr/web/main.do';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('링크 안넘어가짐');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF52B160), // 버튼의 배경색
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // 테두리 모서리를 둥글게
                      ),
                      fixedSize: const Size(65, 10), // 가로 길이 98, 세로 길이 35.89
                    ),
                    child: const Text(
                      '바로가기',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ).paddingZero,
                  ).marginOnly(right: 13),
                ],
              ),
            ),

            Container(
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                ),
              ),
              margin: const EdgeInsets.only(top: 0, right: 20, left: 20),
              padding: const EdgeInsets.only(top: 26, left: 28, bottom: 22),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '●\t\t다국어 생활 상담',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '●\t\t교육, 문화 등 다양한 프로그램 제공',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '●\t\t서울에 거주하는 외국인을 위한 서울 생활에 대한 조언',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '\t\t(한국어, 영어, 중국어 지원)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            //세종학당재단
            Container(
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                ),
              ),
              margin: const EdgeInsets.only(top: 24, right: 20, left: 20),
              padding: const EdgeInsets.only(top: 0, left: 26, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/icon_link_4.png', // 이미지 경로 설정
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '세종학당재단',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF170F01),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      const url = 'https://www.ksif.or.kr/intro.do';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('링크 안넘어가짐');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF52B160), // 버튼의 배경색
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // 테두리 모서리를 둥글게
                      ),
                      fixedSize: const Size(65, 10), // 가로 길이 98, 세로 길이 35.89
                    ),
                    child: const Text(
                      '바로가기',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ).paddingZero,
                  ).marginOnly(right: 13),
                ],
              ),
            ),

            Container(
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                ),
              ),
              margin: const EdgeInsets.only(top: 0, right: 20, left: 20),
              padding: const EdgeInsets.only(top: 28, left: 28, bottom: 22),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '한국어와 한국 문화 교육 프로그램 제공',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\t\t(한국어, 영어, 중국어 지원)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            //다누리포털
            Container(
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                ),
              ),
              margin: const EdgeInsets.only(top: 24, right: 20, left: 20),
              padding: const EdgeInsets.only(top: 0, left: 26, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/icon_link_3.png', // 이미지 경로 설정
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '다누리포털',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF170F01),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      const url =
                          'https://www.liveinkorea.kr/portal/KOR/main/main.do';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('링크 안넘어가짐');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF52B160), // 버튼의 배경색
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // 테두리 모서리를 둥글게
                      ),
                      fixedSize: const Size(65, 10), // 가로 길이 98, 세로 길이 35.89
                    ),
                    child: const Text(
                      '바로가기',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ).paddingZero,
                  ).marginOnly(right: 13).paddingZero,
                ],
              ),
            ),

            Container(
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                ),
              ),
              margin: const EdgeInsets.only(top: 0, right: 20, left: 20),
              padding: const EdgeInsets.only(top: 28, left: 28, bottom: 22),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '●\t\t한국 생활 정보, 온라인 상담, 온라인 교육 제공',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '●\t\t다문화 가정이 한국에서 지원과 보살핌을 받으며 생활할 수 있도록 도와줌',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '(13개국어 지원)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
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
