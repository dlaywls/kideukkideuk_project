import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/components/image_data.dart';
import 'package:kideukkideuk_project/src/components/post_widget.dart';
import 'package:kideukkideuk_project/src/pages/home/health.dart';
import 'package:kideukkideuk_project/src/pages/home/univ.dart';
import 'package:kideukkideuk_project/src/pages/home/work.dart';

final List<String> imgList = [
  "assets/cards/work/1_1.jpg",
  "assets/cards/work/1_2.jpg",
  "assets/cards/work/1_3.jpg",
  "assets/cards/work/1_4.jpg",
  "assets/cards/work/1_5.jpg",
  "assets/cards/work/1_6.jpg",
  "assets/cards/work/1_7.jpg",
  "assets/cards/work/1_8.jpg",
  "assets/cards/work/1_9.jpg",
  "assets/cards/work/1_10.jpg",
];

final List<String> imgList2 = [
  "assets/cards/univ/1_1.jpg",
  "assets/cards/univ/1_2.jpg",
  "assets/cards/univ/1_3.jpg",
  "assets/cards/univ/1_4.jpg",
  "assets/cards/univ/1_5.jpg",
  "assets/cards/univ/1_6.jpg",
  "assets/cards/univ/1_7.jpg",
  "assets/cards/univ/1_8.jpg",
  "assets/cards/univ/1_9.jpg",
];

final List<String> imgList3 = [
  "assets/cards/work/3_1.jpg",
  "assets/cards/work/3_2.jpg",
  "assets/cards/work/3_3.jpg",
  "assets/cards/work/3_4.jpg",
  "assets/cards/work/3_5.jpg",
  "assets/cards/work/3_6.jpg",
];

class Home1 extends StatelessWidget {
  const Home1({Key? key}) : super (key: key);
  
  // 정보 바로보기
  Widget _infoBox(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD2D2D2)),
        borderRadius: BorderRadius.circular(17),
      ),
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 5),
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
              // 노동
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => Work()
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 30,
                      child: Image.asset('assets/images/home_work.png'),
                    ).paddingOnly(bottom: 10),
                    const Text('노동'),
                  ],
                ),
              ),

              // 의료
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => Health()
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 30,
                      child: Image.asset('assets/images/home_health.png'),
                    ).paddingOnly(bottom: 10),
                    const Text('의료'),
                  ],
                ),
              ),

              // 대학생활
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => Univ()
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 30,
                      child: Image.asset('assets/images/home_univ.png'),
                    ).paddingOnly(bottom: 10),
                    const Text('대학생활'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  
  // // 게시글 세로 스크롤 리스트
  // Widget _postList() {
  //   return Column(
  //     children: List.generate(5, (index) => const PostWidget()).toList(),
  //   );
  // }

  // 노동정보 헤더
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFF4D8DF),
              radius: 18,
              child: Image.asset(
                'assets/images/home_work.png',
                width: 25,
              ),
            ).paddingOnly(left: 3),
            const Text(
              '노동 정보',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ).paddingOnly(left: 10)
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageData(
              IconsPath.postMoreIcon,
              size: 15,
            ),
          ),
        ),
      ]),
    );
  }
  // 대학생활 헤더
  Widget _header2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFD4EFD8),
              radius: 18,
              child: Image.asset(
                'assets/images/home_univ.png',
                width: 25,
              ),
            ).paddingOnly(left: 3),
            const Text(
              '대학생활 정보',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ).paddingOnly(left: 10)
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageData(
              IconsPath.postMoreIcon,
              size: 15,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _image1() {
    return SizedBox(
      height: 370,
      child: Swiper(
        itemCount: imgList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(imgList[index], fit: BoxFit.scaleDown);
        },
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.grey,
            activeColor: Colors.brown,
            size: 8,
            activeSize: 8,
            space: 5,
          ),
          margin: EdgeInsets.only(bottom: 15), // 조정 가능한 값
        ),
        control: const SwiperControl(),
        scrollDirection: Axis.horizontal,
        loop: false,
        outer: true,
      ),
    );
  }

  Widget _image2() {
    return SizedBox(
      height: 370,
      child: Swiper(
        itemCount: imgList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(imgList[index], fit: BoxFit.scaleDown);
        },
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.grey,
            activeColor: Colors.brown,
            size: 8,
            activeSize: 8,
            space: 5,
          ),
          margin: EdgeInsets.only(bottom: 15), // 조정 가능한 값
        ),
        control: const SwiperControl(),
        scrollDirection: Axis.horizontal,
        loop: false,
        outer: true,
      ),
    );
  }

  Widget _image3() {
    return SizedBox(
      height: 370,
      child: Swiper(
        itemCount: imgList3.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(imgList3[index], fit: BoxFit.scaleDown);
        },
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.grey,
            activeColor: Colors.brown,
            size: 8,
            activeSize: 8,
            space: 5,
          ),
          margin: EdgeInsets.only(bottom: 15), // 조정 가능한 값
        ),
        control: const SwiperControl(),
        scrollDirection: Axis.horizontal,
        loop: false,
        outer: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
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
            
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              // 터치 시 포커스 설정하여 키보드 나타나게 하기
              FocusScope.of(context).requestFocus(FocusNode());
            },
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
          ).paddingOnly(top: 8, left: 20, bottom: 20),
          
          
          //_storyBoardList(),
          //_hello(),
          _infoBox(context),
          
          //_postList(),
          const SizedBox(height: 10),
          _header(), // 헤더(노동)
          const SizedBox(height: 10),
          _image1(), // 이미지영역
          //_image(),
          
          const SizedBox(height: 10),
          _header2(), // 헤더(대학생활)
          const SizedBox(height: 10),
          _image2(), // 이미지영역

          
          const SizedBox(height: 10),
          _header(), // 헤더(노동)
          const SizedBox(height: 10),
          _image3(), // 이미지영역
        ],
        
      ),
      
    );
    
  }


}