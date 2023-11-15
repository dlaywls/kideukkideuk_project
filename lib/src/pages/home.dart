import 'package:flutter/material.dart';
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
          /*
          (index) => Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey
            ),
           */
          (index) => AvatarWidget(
            type: AvatarType.TYPE1,
            thumbPath: 'https://img.gqkorea.co.kr/gq/2022/09/style_632ac6869b755.jpg',
          ),
        )
      ),
    );
  }

  // 중간 게시글 세로 스크롤 리스트
  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: ImageData(IconsPath.logo, size: 100),
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
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
    //return Container();
  }
}