import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/components/avatar_widget.dart';
import 'package:kideukkideuk_project/src/components/image_data.dart';
import 'package:kideukkideuk_project/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super (key: key);

  // 상단 스토리 가로 스크롤
  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          100,
          (index) => AvatarWidget(
            type: AvatarType.TYPE1,
            thumbPath: 'https://img.gqkorea.co.kr/gq/2022/09/style_632ac6869b755.jpg',
          ),
        )
      ),
    );
  }
  Widget _infoBox() {
    return Container(
      decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFD2D2D2)), // 테두리 속성
      borderRadius: BorderRadius.circular(17), // 테두리의 모서리를 둥글게
      ),
      margin: const EdgeInsets.all(20),  
      child: (
        Container (
          child: const Text('정보 바로보기'),
        )
      )
    );
  }

  // 중간 게시글 세로 스크롤 리스트
  Widget _postList() {
    return Column(
      children: List.generate(5, (index) => const PostWidget()).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          children: [
            ImageData(IconsPath.logo, size: 100),
            //ImageData(IconsPath.logoText, size: 200),
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
          ).paddingOnly(top: 10, left: 30),
          const Text(
            '오늘 당신의 하루를 응원합니다~!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF52B160),
            ),
          ).paddingOnly(top: 8, left: 30, bottom: 30),
          
          
          //_storyBoardList(),
          //_hello(),
          //_infoBox(),
          _postList(),
        ],
      ),
    );
    //return Container();
  }
}