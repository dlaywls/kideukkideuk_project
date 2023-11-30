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
/*
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/home_work.png',
                width: 60,
              ),
              Image.asset(
                'assets/images/home_health.png',
                width: 60,
              ),
              Image.asset(
                'assets/images/home_univ.png',
                width: 60,
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('노동'),
              Text('의료'),
              Text('대학생활'),
            ],
          ),
          */

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Image.asset('assets/images/home_work.png'),
                    radius: 30,
                  ).paddingOnly(bottom: 10),
                  Text('노동'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Image.asset('assets/images/home_health.png'),
                    radius: 30,
                  ).paddingOnly(bottom: 10),
                  Text('의료'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Image.asset('assets/images/home_univ.png'),
                    radius: 30,
                  ).paddingOnly(bottom: 10),
                  Text('대학생활'),
                ],
              ),
            ],
          )



/*
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/icon_work.png"),
                  ),
                  SizedBox(height: 5),
                  Text('노동'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/icon_health.png'),
                  ),
                  SizedBox(height: 5),
                  Text('의료'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/icon_univ.png'),
                  ),
                  SizedBox(height: 5),
                  Text('대학생활'),
                ],
              ),
            
              // _buildCircleAvatarButton(context, '노동', 'assets/images/icon_work.png', '/work'),
              // _buildCircleAvatarButton(context, '의료', 'assets/images/icon_health.png', '/health'),
              // _buildCircleAvatarButton(context, '대학생활', 'assets/images/icon_univ.png', '/univ'),
            ],
          ),
*/

        ],
      ),
    );
  }

/*
  Widget _buildCircleAvatarButton(String label, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 33,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),  
        ),
      ],
    );
  }
*/

  // 버튼 페이지 이동
  /*
  Widget _buildCircleAvatarButton(BuildContext context, String label, String imagePath, String route) {
    return GestureDetector(
      onTap: () {
        // 버튼 클릭 시 다른 페이지로 이동
        Navigator.pushNamed(
          context, route
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 5),
          Text(label),
        ],
      ),
      
    );
  }

*/
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