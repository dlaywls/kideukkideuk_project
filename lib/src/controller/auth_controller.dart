import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/models/kideuk_user.dart';
import 'package:kideukkideuk_project/src/repository/user_repository.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<KUser> user = KUser().obs;

  Future<KUser?> loginUser(String uid) async {
    //DB조회
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }

  void signup(KUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      user(signupUser);
    }
  }
}
