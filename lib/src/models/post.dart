import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String? id;
  final String? title;
  final String? contents;
  final DateTime? dateTime;
  final int? boardId;
  final String? userId;
  final int? likeCount;
  final int? commentCount;

  Post(
      {this.id,
      this.title,
      this.contents,
      this.dateTime,
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
      dateTime: data['datetime'] == null
          ? DateTime.now()
          : DateTime.parse(data['datetime'] as String),
      boardId: data['board_id'] ?? '',
      userId: data['userId'] == null ? '' : data['userId'] as String,
      likeCount: data['likeCount'] ?? 0,
      commentCount: data['like_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'contents': contents,
      'datetime': dateTime?.toUtc().toIso8601String(),
      'board_id': boardId,
      'userId': userId,
      'likeCount': likeCount,
      'comment_count': commentCount
    };
  }

  Post copyWith(
      {String? id,
      String? userId,
      String? title,
      String? contents,
      int? boardId,
      DateTime? dateTime,
      int? likeCount,
      int? commentCount}) {
    return Post(
        id: id ?? this.id,
        title: title ?? this.title,
        contents: contents ?? this.contents,
        dateTime: dateTime ?? this.dateTime,
        boardId: boardId ?? this.boardId,
        userId: userId ?? this.userId,
        likeCount: likeCount ?? this.likeCount,
        commentCount: commentCount ?? this.commentCount);
  }
}
