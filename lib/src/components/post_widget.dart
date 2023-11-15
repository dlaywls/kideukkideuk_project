import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
            nickname: 'KIDEUKKIDEUK',
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
    */
    return CachedNetworkImage(
      imageUrl: 
        'https://i.namu.wiki/i/IhFrc6uiSNlonNFRXzSNrKrhPKrjpmlmsB_SDg3x0PeW_L06BFuF7mOq8AcPDYjonfNpG64cQYsINU8sICeDpg.webp',
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
        children: [
          _header(), // 헤더
          const SizedBox(height: 15),
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