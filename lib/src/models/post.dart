import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String? id;
  final String? title;
  final String? contents;
  final Timestamp? datetime;
  final int? boardId;
  final String? userId;
  final int? likeCount;
  final int? commentCount;

  Post(
      {this.id,
      this.title,
      this.contents,
      this.datetime,
      this.boardId,
      this.userId,
      this.likeCount,
      this.commentCount});

  factory Post.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Post(
      id: doc.id,
      title: data['title'] == null ? '' : data['title'] as String,
      contents: data['contents'] == null ? '' : data['contents'] as String,
      datetime: data['datetime'] ?? Timestamp.now(),
      boardId: data['board_id'] ?? '',
      userId: data['userId'] == null ? '' : data['userId'] as String,
      likeCount: data['like_count'] ?? 0,
      commentCount: data['comment_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'contents': contents,
      'datetime': datetime,
      'board_id': boardId,
      'userId': userId,
      'like_count': likeCount,
      'comment_count': commentCount
    };
  }

  Post copyWith(
      {String? id,
      String? userId,
      String? title,
      String? contents,
      int? boardId,
      Timestamp? datetime,
      int? likeCount,
      int? commentCount}) {
    return Post(
        id: id ?? this.id,
        title: title ?? this.title,
        contents: contents ?? this.contents,
        datetime: datetime ?? this.datetime,
        boardId: boardId ?? this.boardId,
        userId: userId ?? this.userId,
        likeCount: likeCount ?? this.likeCount,
        commentCount: commentCount ?? this.commentCount);
  }
}
