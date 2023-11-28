import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kideukkideuk_project/src/models/post.dart';
import 'package:kideukkideuk_project/src/repository/comment_repository.dart';
import 'package:kideukkideuk_project/src/repository/user_repository.dart';

class PostRepository {
  final CollectionReference _posts =
      FirebaseFirestore.instance.collection('posts');
  final CommentRepository _commentRepository = CommentRepository();
  //게시글 등록하기
  void addPost({
    required String title,
    required String contents,
    required int boardId,
  }) async {
    // 현재 사용자의 ID 얻어오기
    String? userId = await UserRepository.getCurrentUserId();

    // 문서를 추가하면 Firestore에서 자동으로 고유한 ID를 생성하고 반환합니다.
    DocumentReference documentReference = await _posts.add({
      'title': title,
      'contents': contents,
      'board_id': boardId,
      'comment_count': 0,
      'like_count': 0,
      'user_id': userId, // 현재 사용자의 ID 추가
      // 기타 필요한 데이터 추가 가능
    });

    // 추가된 문서의 ID를 가져와서 Post 객체에 설정합니다.
    String postId = documentReference.id;
    print('Added post with ID: $postId');
  }

  //게시글 보여주기
  Future<List<Post>> getPostsByBoardId(int boardId) async {
    try {
      // boardId와 일치하는 post 문서들을 가져오기 위한 쿼리
      QuerySnapshot querySnapshot =
          await _posts.where('board_id', isEqualTo: boardId).get();

      // QuerySnapshot으로부터 문서들을 가져와 List<Post>로 변환합니다.
      List<Post> posts =
          querySnapshot.docs.map((doc) => Post.fromFirestore(doc)).toList();
      return posts;
    } catch (e) {
      // 에러가 발생할 경우 예외를 처리합니다.
      print("Error getting posts by boardId: $e");
      return [];
    }
  }

  Future<void> addLike({required int likeCount, required String postId}) async {
    try {
      // 특정 게시물에 대한 문서 참조 가져오기
      DocumentReference postReference = _posts.doc(postId);

      // likeCount 필드 업데이트
      await postReference.update({
        'like_count': likeCount,
      });

      print('게시물 ID $postId에 좋아요가 추가되었습니다.');
    } catch (e) {
      // 에러 처리
      print("좋아요 추가 중 오류 발생: $e");
    }
  }

  //게시물 작성한 사용자 아이디 가져오기
  Future<String?> getPostUserId({required String postId}) async {
    try {
      // 게시물 문서 참조 가져오기
      DocumentReference postReference = _posts.doc(postId);

      // 게시물 문서 가져오기
      DocumentSnapshot postSnapshot = await postReference.get();

      // 게시물이 존재하는지 확인 후 유저 아이디 반환
      if (postSnapshot.exists) {
        Map<String, dynamic>? postData =
            postSnapshot.data() as Map<String, dynamic>?;
        return postData?['user_id'];
      } else {
        print('게시물이 존재하지 않습니다.');
        return null;
      }
    } catch (e) {
      print('게시물 작성자 아이디 가져오기 중 오류 발생: $e');
      return null;
    }
  }

  // 특정 postId에 대한 댓글 개수 가져오기
  Future<int> addCommentCount(String postId) async {
    int commentCount = await _commentRepository.getCommentCountByPostId(postId);
    DocumentReference postReference = _posts.doc(postId);
    await postReference.update({
      'comment_count': commentCount,
    });
    [print("comment count: $commentCount")];

    return commentCount;
  }

  //boardId 가져오기
  Future<int?> getBoardId({required String postId}) async {
    try {
      // 게시물 문서 참조 가져오기
      DocumentReference postReference = _posts.doc(postId);

      // 게시물 문서 가져오기
      DocumentSnapshot postSnapshot = await postReference.get();

      // 게시물이 존재하는지 확인 후 유저 아이디 반환
      if (postSnapshot.exists) {
        Map<String, dynamic>? postData =
            postSnapshot.data() as Map<String, dynamic>?;
        return postData?['board_id'];
      } else {
        print('게시물이 존재하지 않습니다.');
        return 0;
      }
    } catch (e) {
      print('게시물 작성자 아이디 가져오기 중 오류 발생: $e');
      return 0;
    }
  }
}
