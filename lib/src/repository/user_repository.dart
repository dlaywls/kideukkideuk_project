import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
}
