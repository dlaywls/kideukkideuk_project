import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kideukkideuk_project/src/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kideukkideuk_project/src/controller/auth_controller.dart';
import 'package:kideukkideuk_project/src/models/kideuk_user.dart';
import 'package:kideukkideuk_project/src/pages/login.dart';
import 'package:kideukkideuk_project/src/pages/signupPage.dart';

class Root extends GetView<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext _, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          return FutureBuilder<KUser?>(
            future: controller.loginUser(user.data!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const App();
              } else {
                return Obx(() => controller.user.value.uid != null
                    ? const App()
                    : SignupPage(uid: user.data!.uid));
              }
            },
          );
        } else {
          return const Login();
        }
      },
    );
  }
}
