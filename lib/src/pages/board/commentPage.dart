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
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool isLiked = false;
  final PostRepository _postRepository = PostRepository();
  final PostController postController = Get.put(PostController());
  final CommnetController commentController = Get.put(CommnetController());
  final UserRepository userRepository = UserRepository();

  TextEditingController textEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadComments();
  }

  // 댓글을 불러오는 함수
  void loadComments() async {
    await commentController.fetchComments(postId: widget.postId);
    widget.likeCount =
        (await postController.fetchLikeCount(postId: widget.postId))!;
    setState(() {});
  }

  void onAddCommentPressed(String contents, String postId) async {
    commentController.addComment(contents: contents, postId: postId); // 댓글을 추가
    await postController.fetchCommentCount(postId: postId);
    await commentController.fetchComments(postId: postId); // 댓글을 가져오고
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("postId: ${widget.postId}");
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
        elevation: 0.5,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            height: 1.0,
            color: const Color(0xFFD4D4D4),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 클릭한 글
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            //프로필 정보
                            Icon(Icons.person, size: 30),
                            Text(
                              '  익명',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff170f01),
                              ),
                            )
                          ],
                        ).marginOnly(left: 8, top: 8, bottom: 8),
                        //제목
                        Text(widget.title,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xfff170f01)))
                            .marginOnly(left: 8, top: 12, bottom: 8),
                        //글 내용
                        Text(widget.content,
                                style: const TextStyle(
                                    fontSize: 14, color: Color(0xfff170f01)))
                            .marginOnly(left: 8, bottom: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //좋아요 수
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/icon_number_of_like.png',
                                  width: 25,
                                  height: 25,
                                ),
                                Text(
                                  '${widget.likeCount ?? 0}',
                                  style: const TextStyle(
                                    fontSize: 13.0,
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
                                  'assets/images/icon_number_of_comments.png',
                                  width: 25,
                                  height: 25,
                                ),
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
                                        isLiked = !isLiked;
                                      });

                                      await _postRepository.addLike(
                                          likeCount: widget.likeCount,
                                          postId: widget.postId);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isLiked
                                          ? const Color(0xFFF56587)
                                          : const Color(0xFFEEEEEE),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/icon_like_button.png',
                                        ),
                                        const SizedBox(width: 4.0),
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
                  // 댓글
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: commentController.comments.length,
                      itemBuilder: (context, index) {
                        Comment comment = commentController.comments[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.person, size: 18),
                                Text(
                                  '  익명',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xfff170f01),
                                  ),
                                )
                              ],
                            ).marginOnly(
                                left: 16, top: 8, right: 16, bottom: 0),
                            ListTile(
                              title: Text(comment.contents ?? ""),
                            ).marginOnly(right: 3, left: 3, top: 0, bottom: 0),
                            const Divider(
                              color: Color(0xFFD6D6D6),
                              thickness: 1,
                            ).marginOnly(right: 16, left: 16, top: 0),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 댓글 쓰는 곳
          Container(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: textEditController,
              decoration: InputDecoration(
                hintText: "댓글을 입력하세요.",
                hintStyle: TextStyle(fontSize: 12, color: Color(0xff9E9E9E)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xffECECEC),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                //보내기 버튼
                suffixIcon: IconButton(
                  icon: Image.asset(
                    'assets/images/button_send_comment.png',
                  ),
                  onPressed: () {
                    onAddCommentPressed(textEditController.text, widget.postId);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
