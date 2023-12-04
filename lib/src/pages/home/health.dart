import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/components/image_data.dart';

final List<String> imgList = [
  "assets/cards/health/001.jpg",
  "assets/cards/health/002.jpg",
  "assets/cards/health/003.jpg",
  "assets/cards/health/004.jpg",
  "assets/cards/health/005.jpg",
  "assets/cards/health/006.jpg",
  "assets/cards/health/007.jpg",
  "assets/cards/health/008.jpg",
  "assets/cards/health/009.jpg",
  "assets/cards/health/010.jpg",
];

class Health extends StatelessWidget {
  const Health({super.key});

  // 의료 헤더
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFF6EAD6),
              radius: 18,
              child: Image.asset(
                'assets/images/home_health.png',
                width: 25,
              ),
            ).paddingOnly(left: 3),
            const Text(
              '의료 정보',
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
                '의료 정보',
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
        ]
      ),
    );
  }
}