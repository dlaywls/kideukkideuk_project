import 'package:cached_network_image/cached_network_image.dart';
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
          AvatarWidget(
            type: AvatarType.TYPE3,
            nickname: '노동정보',
            size: 40,
            thumbPath: 
              'https://img.gqkorea.co.kr/gq/2022/09/style_632ac6869b755.jpg',
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                size: 30,
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
        child: Image.asset('assets/images/1.jpg'),
        borderRadius: BorderRadius.circular(15.0),
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
          ),
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