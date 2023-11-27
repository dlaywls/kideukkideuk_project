import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kideukkideuk_project/src/models/comment.dart';
import 'package:kideukkideuk_project/src/repository/comment_repository.dart';

class CommnetController extends GetxController {
  final CommentRepository _commentRepository = CommentRepository();
  final RxList<Comment> comments = <Comment>[].obs;

  Future<void> fetchComments({required String postId}) async {
    List<Comment> fetchedComments =
        await _commentRepository.getCommentsByPostId(postId);
    comments.assignAll(fetchedComments);
    print(comments.length);
  }

  void addComment({required String contents, required String postId}) async {
    try {
      await _commentRepository.addComment(contents: contents, postId: postId);
      // 성공적으로 댓글을 추가한 후 수행할 작업 추가
    } catch (e) {
      // 실패한 경우 예외 처리
      print("댓글 추가 실패: $e");
    }
  }
}