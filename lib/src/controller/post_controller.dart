import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kideukkideuk_project/src/models/post.dart';
import 'package:kideukkideuk_project/src/repository/post_repositroy.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final RxList<Post> posts = <Post>[].obs;
  final RxInt commentCounts = 0.obs;
  final RxInt likeCount = 0.obs;

  Future<void> fetchPosts(int boardId) async {
    List<Post> fetchedPosts = await _postRepository.getPostsByBoardId(boardId);
    posts.assignAll(fetchedPosts);
    print("글 개수: ${posts.length}");
  }

  Future<String> loadUserId({required String postId}) async {
    String? userId;
    userId = await _postRepository.getPostUserId(postId: postId);
    if (userId != null) {
      print("userId: $userId");
      return userId;
    } else {
      print("게시물 작성자 아이디를 가져오는 데 실패했습니다.");
      return "실패";
    }
  }

  Future<void> fetchCommentCount({required String postId}) async {
    commentCounts.value = await _postRepository.addCommentCount(postId);
  }

  Future<int?> fetchLikeCount({required String postId}) async {
    likeCount.value = await _postRepository.addlikeCount(postId);
    print("like: ${likeCount.value}");
    return likeCount.value;
  }
}
