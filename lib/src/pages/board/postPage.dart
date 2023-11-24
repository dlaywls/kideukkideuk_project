// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/controller/post_controller.dart';
import 'package:kideukkideuk_project/src/models/post.dart';
import 'package:kideukkideuk_project/src/pages/board/commentPage.dart';
import 'package:kideukkideuk_project/src/pages/board/writePage.dart';

class PostView extends StatelessWidget {
  final String language;
  final int id;
  final PostController controller = Get.put(PostController());

  PostView({Key? key, required this.language, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetchPosts(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$language 게시판",
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF241701),
          ),
        ), // AppBar에 버튼 텍스트 표시
        elevation: 0.5, // 그림자 제거
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0), // 선의 높이
          child: Container(
            height: 1.0,
            color: const Color(0xFFD4D4D4), // 선의 색상
          ),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  Post post = controller.posts[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          post.title ?? 'No Title',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFbac170F01),
                          ),
                        ).marginOnly(left: 5, top: 13),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.contents ?? '',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFFbac170F01),
                              ),
                            ).marginOnly(left: 5, top: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icon_number_of_like.png', // 좋아요 이미지 경로 설정
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      '${post.likeCount ?? 0}',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xFFF56587),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icon_number_of_comments.png', // 좋아요 이미지 경로 설정
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      '${post.commentCount ?? 0}',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xFF52B160),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // 각 항목을 눌렀을 때 해당 항목의 세부 페이지로 이동
                        onTap: () {
                          Get.to(() => CommentPage(
                              title: post.title ?? '',
                              content: post.contents ?? '',
                              language: language,
                              likeCount: post.likeCount ?? 0,
                              commentCount: post.commentCount ?? 0));
                        },
                      ),
                      // 구분선 추가
                      const Divider(
                        color: Color(0xFFD4D4D4), // 구분선 색상
                        thickness: 1, // 구분선 두께
                      ),
                    ],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // '글쓰기' 버튼이 눌렸을 때 새로운 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WritePage(
                        boardId: id,
                        language: language,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF52B160), // 버튼의 배경색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // 테두리 모서리를 둥글게
                  ),
                  fixedSize: const Size(98, 35.89), // 가로 길이 98, 세로 길이 35.89
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icon_write.png', // 이미지 경로 설정
                    ),
                    const SizedBox(width: 4.0), // 이미지와 텍스트 사이의 간격 조절
                    const Text(
                      '글쓰기',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ).paddingOnly(bottom: 13),
            ),
          ],
        ),
      ),
    );
  }
}
