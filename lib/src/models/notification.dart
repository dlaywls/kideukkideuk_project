import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  final String? id;
  final Timestamp? datetime;
  final String? receiverId;
  final String? contents;
  final int? boardId;
  final String? postTitle;
  final String? postContents;
  final int? postLikeCount;
  final int? postCommentCount;
  final String? postId;

  Notification(
      {this.postTitle,
      this.postContents,
      this.postLikeCount,
      this.postCommentCount,
      this.id,
      this.datetime,
      this.receiverId,
      this.contents,
      this.boardId,
      this.postId});

  factory Notification.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Notification(
      id: doc.id,
      datetime: data['datetime'] ?? Timestamp.now(),
      receiverId:
          data['receiver_id'] == null ? '' : data['receiver_id'] as String,
      contents: data['contents'] == null ? '' : data['contents'] as String,
      boardId: data['board_id'] ?? '',
      postTitle: data['post_title'] == null ? '' : data['post_title'] as String,
      postContents:
          data['post_contents'] == null ? '' : data['post_contents'] as String,
      postLikeCount: data['like_count'] ?? '',
      postCommentCount: data['comment_count'] ?? '',
      postId: data['postId'] == null ? '' : data['postId'] as String,
    );
  }
}
