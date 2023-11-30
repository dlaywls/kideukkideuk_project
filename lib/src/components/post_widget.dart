import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/components/avatar_widget.dart';
import 'package:kideukkideuk_project/src/components/image_data.dart';

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
                  fontSize: 16,
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
    /*
    return ImageData(
      IconsPath.profileImage,
      size: 100
    );

    
    //return Image.asset('assets/images/1.jpg');
    return ClipRRect(
      child: Image.asset('assets/images/1.jpg'),
      borderRadius: BorderRadius.circular(20.0),
    );
    */
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset('assets/images/1.jpg'),
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
          _image(), // 이미지영역
          _infoCount(), // 좋아요 영역
          // _infoDescription(), // 글 영역
          // _replyTextBtn(), // 댓글 영역
          // _dateAgo(),
        ]
      ),
    );
  }
}