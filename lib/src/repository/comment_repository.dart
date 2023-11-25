import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kideukkideuk_project/src/models/comment.dart';
import 'package:kideukkideuk_project/src/repository/user_repository.dart';

class CommentRepository {
  final CollectionReference _comments =
      FirebaseFirestore.instance.collection('comments');
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
      // 기타 필요한 데이터 추가 가능
    });
  }

  //게시글 보여주기
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
}
