import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kideukkideuk_project/src/models/notification.dart';
import 'package:kideukkideuk_project/src/models/post.dart';

class NotificationRepository {
  final CollectionReference _notification =
      FirebaseFirestore.instance.collection('notification');
  //알람 등록하기
  Future<void> addNotification({
    required String receiverId,
    required String contents,
    required int boardId,
    required Post post,
    required String postId,
  }) async {
    try {
      // 문서를 추가하면 Firestore에서 자동으로 고유한 ID를 생성하고 반환합니다.
      await _notification.add({
        'receiver_id': receiverId,
        'contents': contents,
        'board_id': boardId,
        'post_title': post.title ?? '', // post.title이 null이면 빈 문자열을 사용
        'post_contents': post.contents ?? '', // post.contents가 null이면 빈 문자열을 사용
        'like_count': post.likeCount ?? 0, // post.likeCount가 null이면 0을 사용
        'comment_count': post.commentCount ?? 0,
        'datetime': FieldValue.serverTimestamp(),
        'postId': postId // post.commentCount가 null이면 0을 사용
      });
    } catch (e) {
      // Firestore 작업 중에 오류가 발생하면 예외를 처리합니다.
      print('알림을 추가하는 중 오류가 발생했습니다: $e');
      // 예외 처리에 대한 추가적인 로직을 추가할 수 있습니다.
    }
  }

  //알람 가져오기
  Future<List<Notification>> getNotificationsByReceiverId(
      String receiverId) async {
    try {
      // boardId와 일치하는 post 문서들을 가져오기 위한 쿼리
      QuerySnapshot querySnapshot = await _notification
          .where('receiver_id', isEqualTo: receiverId)
          .orderBy('datetime', descending: true)
          .get();

      // QuerySnapshot으로부터 문서들을 가져와 List<Post>로 변환합니다.
      List<Notification> notifications = querySnapshot.docs
          .map((doc) => Notification.fromFirestore(doc))
          .toList();

      print("알람 수: ${notifications.length}");
      print("사용자 아이디: ${receiverId}");
      return notifications;
    } catch (e) {
      // 에러가 발생할 경우 예외를 처리합니다.
      print("Error getting nofity by receiver_id: $e");
      return [];
    }
  }
}
