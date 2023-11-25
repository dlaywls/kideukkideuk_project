import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kideukkideuk_project/src/models/kideuk_user.dart';

class UserRepository {
  static Future<KUser?> loginUserByUid(String uid) async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();

    if (data.size == 0) {
      return null;
    } else {
      return KUser.fromJson(data.docs.first.data());
    }
  }

  static Future<bool> signup(KUser user) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  //현재 사용자의 id 가져오기
  static Future<String?> getCurrentUserId() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      return user?.uid;
    } catch (e) {
      print("Error getting current user ID: $e");
      return null;
    }
  }

  Future<String> getNicknameForUser({String? uid}) async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    try {
      QuerySnapshot usersSnapshot = await usersCollection
          .where('uid', isEqualTo: uid)
          .limit(1) // 하나의 문서만 가져오도록 제한
          .get();

      if (usersSnapshot.size > 0) {
        // uid가 userId인 문서 중 첫 번째 문서의 데이터를 가져옴
        Map<String, dynamic> userData =
            usersSnapshot.docs.first.data() as Map<String, dynamic>;
        print(userData['nickname'] as String?);
        return userData['nickname'] as String;
      } else {
        return "익명"; // 사용자가 존재하지 않을 경우 예외 처리
      }
    } catch (e) {
      print("Error getting user nickname: $e");
      return "익명";
    }
  }
}
