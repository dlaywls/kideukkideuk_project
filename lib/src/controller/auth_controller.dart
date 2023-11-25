import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/models/kideuk_user.dart';
import 'package:kideukkideuk_project/src/repository/user_repository.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final UserRepository _repository = UserRepository();
  RxString nickname = RxString('');

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

  /*Future<String> fetchNickname({String? userId}) async {
    String? fetchedNickname = await _repository.getNicknameForUser(userId!);

    if (fetchedNickname != null) {
      nickname.value = fetchedNickname;
      return fetchedNickname;
    } else {
      print("User not found or nickname is null");
      return ' ';
    }
  }*/
}
