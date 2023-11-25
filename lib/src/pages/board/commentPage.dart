import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/controller/comment_controller.dart';
import 'package:kideukkideuk_project/src/controller/post_controller.dart';
import 'package:kideukkideuk_project/src/models/comment.dart';

import 'package:kideukkideuk_project/src/repository/post_repositroy.dart';
import 'package:kideukkideuk_project/src/repository/user_repository.dart';

class CommentPage extends StatefulWidget {
  final String title;
  final String content;
  final String language;
  int likeCount;
  final int commentCount;
  final String postId;

  CommentPage(
      {Key? key,
      required this.title,
      required this.content,
      required this.language, // const 제거
      required this.likeCount,
      required this.commentCount,
      required this.postId});

  @override
  // ignore: library_private_types_in_public_api
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool isLiked = false;
  final PostRepository _postRepository = PostRepository();
  final PostController postController = Get.put(PostController());
  final CommnetController commentController = Get.put(CommnetController());
  final UserRepository userRepository = UserRepository();

  TextEditingController textEditController = TextEditingController();
  //String? userId; // userId를 상태 변수로 선언
  //String nickname = "";

  /*@override
  void initState() {
    super.initState();
    // initState에서 userId를 초기화
    _loadUserInfo();
  }*/

  // 비동기적으로 userId 및 nickname을 가져오는 함수
  /*Future<void> _loadUserInfo() async {
    userId = await postController.loadUserId(postId: widget.postId) as String?;
    if (userId != null) {
      print("userId: $userId");
      nickname = await userRepository.getNicknameForUser(uid: userId) as String;
      if (nickname != null) {
        print("nickname: $nickname");
      } else {
        print("닉네임을 가져오는 데 실패했습니다.");
      }
    } else {
      print("게시물 작성자 아이디를 가져오는 데 실패했습니다.");
    }
  }*/

  @override
  void initState() {
    super.initState();
    loadComments();
  }

  // 댓글을 불러오는 함수
  void loadComments() async {
    await commentController.fetchComments(postId: widget.postId);
    setState(() {});
  }

  void onAddCommentPressed(String contents, String postId) async {
    await commentController.fetchComments(postId: postId); // 댓글을 가져오고
    commentController.addComment(contents: contents, postId: postId); // 댓글을 추가
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.language} 게시판",
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF241701),
          ),
        ),
        elevation: 0.5, // 그림자 제거
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0), // 선의 높이
          child: Container(
            height: 1.0,
            color: const Color(0xFFD4D4D4), // 선의 색상
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            // 클릭한 글
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      //프로필 정보
                      Icon(Icons.person, size: 24),
                      Text(
                        '익명',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF170F01),
                        ),
                      )
                    ],
                  ).marginOnly(left: 8, top: 10),
                  //제목
                  Text(widget.title,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfff170f01)))
                      .marginOnly(left: 8, top: 12, bottom: 8),
                  //글 내용
                  Text(widget.content,
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xFFF170F01)))
                      .marginOnly(left: 8, bottom: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //좋아요 수

                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icon_number_of_like.png', // 좋아요 이미지 경로 설정
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${widget.likeCount ?? 0}',
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFFF56587),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      // 댓글 수
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icon_number_of_comments.png', // 댓글 이미지 경로 설정
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${widget.commentCount ?? 0}',
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF52B160),
                            ),
                          ),
                        ],
                      ),
                      //좋아요 버튼
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (isLiked) {
                                  widget.likeCount--;
                                } else {
                                  widget.likeCount++;
                                }

                                setState(() {
                                  // 좋아요 버튼을 눌렀을 때 상태를 반전
                                  isLiked = !isLiked;
                                });

                                // 좋아요 수 업데이트
                                await _postRepository.addLike(
                                    likeCount: widget.likeCount,
                                    postId: widget.postId);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isLiked
                                    ? const Color(0xFFF56587) // 좋아요를 눌렀을 때의 색상
                                    : const Color(
                                        0xFFEEEEEE), // 좋아요를 누르지 않았을 때의 색상
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/icon_like_button.png', // 이미지 경로 설정
                                  ),
                                  const SizedBox(
                                      width: 4.0), // 이미지와 텍스트 사이의 간격 조절
                                  const Text(
                                    '좋아요',
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        color: Color(0xff9E9E9E)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ).marginOnly(right: 8),
                      ),
                    ],
                  ).marginOnly(
                    left: 8,
                  ),
                ],
              ),
            ),
            //구분선
            const Divider(
              color: Color(0xFFD4D4D4),
              thickness: 1,
            ),
            // 댓글 리사이클러뷰
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.white,
                child: ListView.builder(
                  itemCount: commentController.comments.length,
                  // 댓글 아이템 개수
                  itemBuilder: (context, index) {
                    Comment comment = commentController.comments[index];
                    return ListTile(
                      title: Text(comment.contents ?? ""),
                      // Add other comment details as needed
                    );
                  },
                ),
              ),
            ),

            // 댓글 쓰는 곳
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditController,
                      decoration: InputDecoration(
                        hintText: "댓글을 입력하세요.",
                        hintStyle: const TextStyle(
                            fontSize: 12, color: Color(0xff9E9E9E)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xffECECEC),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),

                        //보내기 버튼
                        suffixIcon: IconButton(
                          icon: Image.asset(
                            'assets/images/button_send_comment.png', // 이미지 경로 설정
                          ),
                          onPressed: () {
                            // 보내기 버튼 눌렀을 때
                            onAddCommentPressed(
                                textEditController.text, widget.postId);
                          },
                        ),
                      ),
                    ).paddingAll(5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
