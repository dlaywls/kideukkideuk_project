import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String? id;
  final String? contents;
  final Timestamp? datetime;
  final String? postId;
  final String? userId;

  Comment({this.id, this.contents, this.datetime, this.postId, this.userId});

  factory Comment.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Comment(
      id: doc.id,
      contents: data['contents'] == null ? '' : data['contents'] as String,
      datetime: data['datetime'] ?? Timestamp.now(),
      postId: data['post_id'] ?? '',
      userId: data['userId'] == null ? '' : data['userId'] as String,
    );
  }
}
