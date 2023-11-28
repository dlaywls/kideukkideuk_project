import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  final String? id;
  final DateTime? datetime;
  final String? receiverId;
  final String? contents;
  final int? boardId;

  Notification(
      {this.id, this.datetime, this.receiverId, this.contents, this.boardId});

  factory Notification.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Notification(
      id: doc.id,
      datetime: data['datetime'] == null
          ? DateTime.now()
          : DateTime.parse(data['datetime'] as String),
      receiverId:
          data['receiver_id'] == null ? '' : data['receiver_id'] as String,
      contents: data['contents'] == null ? '' : data['contents'] as String,
      boardId: data['board_id'] ?? '',
    );
  }
}
