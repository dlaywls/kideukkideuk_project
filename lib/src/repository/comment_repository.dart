import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kideukkideuk_project/src/models/comment.dart';
import 'package:kideukkideuk_project/src/repository/nofitication_repository.dart';
import 'package:kideukkideuk_project/src/repository/post_repositroy.dart';
import 'package:kideukkideuk_project/src/repository/user_repository.dart';

class CommentRepository {
  final CollectionReference _comments =
      FirebaseFirestore.instance.collection('comments');

  late final NotificationRepository notificationRepository =
      new NotificationRepository();
  late final PostRepository postRepository = new PostRepository();

  //게시글 등록하기
  Future<void> addComment({
    required String contents,
    required String postId,
  }) async {
    // 현재 사용자의 ID 얻어오기
    String? userId = await UserRepository.getCurrentUserId();

    // 문서를 추가하면 Firestore에서 자동으로 고유한 ID를 생성하고 반환합니다.
    DocumentReference documentReference = await _comments.add({
      'contents': contents,
      'post_id': postId,
      'user_id': userId // 현재 사용자의 ID 추가
    });

    String? receiverId = await postRepository.getPostUserId(postId: postId);
    int? boardId = await postRepository.getBoardId(postId: postId);

    notificationRepository.addNotification(
      receiverId: receiverId ?? "",
      contents: contents ?? "",
      boardId: boardId ?? 14,
    ); //알람에 추가.
  }

  //댓글 보여주기
  Future<List<Comment>> getCommentsByPostId(String postId) async {
    try {
      // boardId와 일치하는 post 문서들을 가져오기 위한 쿼리
      QuerySnapshot querySnapshot =
          await _comments.where('post_id', isEqualTo: postId).get();

      // QuerySnapshot으로부터 문서들을 가져와 List<Post>로 변환합니다.
      List<Comment> comments =
          querySnapshot.docs.map((doc) => Comment.fromFirestore(doc)).toList();
      return comments;
    } catch (e) {
      // 에러가 발생할 경우 예외를 처리합니다.
      print("Error getting posts by boardId: $e");
      return [];
    }
  }

  Future<int> getCommentCountByPostId(String postId) async {
    try {
      // Use a query to count documents with a specific postId
      QuerySnapshot querySnapshot =
          await _comments.where('post_id', isEqualTo: postId).get();
      // Return the number of documents
      return querySnapshot.size;
    } catch (e) {
      // Handle any errors that might occur
      print("Error getting comment count by postId: $e");
      return 0;
    }
  }

  Future<String?> getCommentContentsByCommentId(
      {required String commentId}) async {
    try {
      DocumentReference commentReference = _comments.doc(commentId);

      DocumentSnapshot commentSnapshot = await commentReference.get();

      // 게시물이 존재하는지 확인 후 유저 아이디 반환
      if (commentSnapshot.exists) {
        Map<String, dynamic>? postData =
            commentSnapshot.data() as Map<String, dynamic>?;
        return postData?['contents'];
      } else {
        print('댓글이 존재하지 않습니다.');
        return null;
      }
    } catch (e) {
      // Handle any errors that might occur
      print("Error getting comment contents by commentId: $e");
      return null;
    }
  }
}
