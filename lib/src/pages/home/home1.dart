import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/components/image_data.dart';
import 'package:kideukkideuk_project/src/components/post_widget.dart';

class Home1 extends StatelessWidget {
  const Home1({Key? key}) : super (key: key);
  
  // 정보 바로보기
  Widget _infoBox() {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD2D2D2)),
        borderRadius: BorderRadius.circular(17),
      ),
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '정보 바로보기',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ).paddingOnly(top: 15, left: 15, bottom: 20),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 30,
                    child: Image.asset('assets/images/home_work.png'),
                  ).paddingOnly(bottom: 10),
                  const Text('노동'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 30,
                    child: Image.asset('assets/images/home_health.png'),
                  ).paddingOnly(bottom: 10),
                  const Text('의료'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 30,
                    child: Image.asset('assets/images/home_univ.png'),
                  ).paddingOnly(bottom: 10),
                  const Text('대학생활'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
  // 게시글 세로 스크롤 리스트
  Widget _postList() {
    return Column(
      children: List.generate(5, (index) => const PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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

            SizedBox(
              width: 70, // 이미지의 너비
              height: 20, // 이미지의 높이
              child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/logo_text.png', // 이미지 경로
                    fit: BoxFit.contain, // 이미지가 컨테이너에 어떻게 맞출지 설정
                  ),
                ).paddingOnly(left: 8),
              ),
  
            const Text(
              '키득키득',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF241701),
              )
            ).paddingOnly(left: 10)
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.homeSearch,
                size: 30,
              ),
            ),
          )
        ]
      ),
      body: ListView(
        children: [
          // 추가
          const Text(
            '키득이님,',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF241701),
            ),
          ).paddingOnly(top: 10, left: 20),
          const Text(
            '오늘 당신의 하루를 응원합니다~!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF52B160),
            ),
          ).paddingOnly(top: 8, left: 20, bottom: 30),
          
          
          //_storyBoardList(),
          //_hello(),
          _infoBox(),
          
          _postList(),
        ],
        
      ),
      
    );
    
  }


}