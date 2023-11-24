import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kideukkideuk_project/src/models/post.dart';
import 'package:kideukkideuk_project/src/repository/user_repository.dart';

class PostRepository {
  //게시글 등록하기
  void addPost({
    required String title,
    required String contents,
    required int boardId,
  }) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    // 현재 사용자의 ID 얻어오기
    String? userId = await UserRepository.getCurrentUserId();

    // 문서를 추가하면 Firestore에서 자동으로 고유한 ID를 생성하고 반환합니다.
    DocumentReference documentReference = await posts.add({
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
    final CollectionReference _posts =
        FirebaseFirestore.instance.collection('posts');
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
}
