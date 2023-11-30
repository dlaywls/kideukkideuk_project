import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/components/image_data.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

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

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super (key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFF4D8DF),
                radius: 18,
                child: Image.asset(
                  'assets/images/home_work.png',
                  width: 25,),
              ).paddingOnly(left: 3),
              const Text(
                '노동정보',
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
        ]
      ),
    );
      
  }

  Widget _image() {
    return SizedBox(
      height: 370,
      child: Swiper(
        itemCount: imgList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(imgList[index], fit: BoxFit.scaleDown);
        },
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter
        ),
        control: const SwiperControl(),
        scrollDirection: Axis.horizontal,
        loop: false,
      ),
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
          margin: EdgeInsets.only(bottom:15), // 조정 가능한 값
        ),
        control: const SwiperControl(),
        scrollDirection: Axis.horizontal,
        loop: false,
        outer: true,
      ),
    );
  }


  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon, // 좋아요
                size: 70,
              ),
              const SizedBox(width: 15),
              ImageData(
                IconsPath.replyIcon, // 댓글
                size: 70,
              ),
              const SizedBox(width: 15),
              ImageData(
                IconsPath.directMessage, // DM
                size: 70,
              ),
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            size: 50,
          ).paddingOnly(right: 8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(), // 헤더
          const SizedBox(height: 10),
          _image1(), // 이미지영역
          //_image(),
          //_infoCount(), // 좋아요 영역
          // _infoDescription(), // 글 영역
          // _replyTextBtn(), // 댓글 영역
          // _dateAgo(),
        ]
      ),
    );
  }
}