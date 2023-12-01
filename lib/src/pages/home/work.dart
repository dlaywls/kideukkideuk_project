import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/components/image_data.dart';

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
  "assets/cards/work/2_1.jpg",
  "assets/cards/work/2_2.jpg",
  "assets/cards/work/2_3.jpg",
  "assets/cards/work/2_4.jpg",
  "assets/cards/work/2_5.jpg",
  "assets/cards/work/2_6.jpg",
];

final List<String> imgList3 = [
  "assets/cards/work/3_1.jpg",
  "assets/cards/work/3_2.jpg",
  "assets/cards/work/3_3.jpg",
  "assets/cards/work/3_4.jpg",
  "assets/cards/work/3_5.jpg",
  "assets/cards/work/3_6.jpg",
];

class Work extends StatelessWidget {
  const Work({super.key});

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
        itemCount: imgList2.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(imgList2[index], fit: BoxFit.scaleDown);
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
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios, // 뒤로가기 아이콘
            color: Colors.brown, // 아이콘 색상
          ),
          onPressed: () {
            Navigator.pop(context); // 현재 페이지에서 뒤로가기
          },
        ),
        centerTitle: true, // 타이틀 가운데 정렬
          title: const Text(
                '노동 정보',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )
              ).paddingOnly(left: 10)
          ),

      body: ListView(
        children: [
          const SizedBox(height: 10),
          _header(), // 헤더
          const SizedBox(height: 10),
          _image1(), // 이미지영역
          //_image(),
          
          const SizedBox(height: 10),
          _header(), // 헤더
          const SizedBox(height: 10),
          _image2(), // 이미지영역

          
          const SizedBox(height: 10),
          _header(), // 헤더
          const SizedBox(height: 10),
          _image3(), // 이미지영역
        ]),
      );
  }
}