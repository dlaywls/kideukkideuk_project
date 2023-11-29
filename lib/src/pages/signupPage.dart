import 'package:flutter/material.dart';
import 'package:kideukkideuk_project/src/controller/auth_controller.dart';
import 'package:kideukkideuk_project/src/models/kideuk_user.dart';

class SignupPage extends StatefulWidget {
  final String uid;
  const SignupPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nicknameController = TextEditingController();

  Widget _nickname() {
    return TextField(
      controller: nicknameController,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10), hintText: '닉네임'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('회원가입'),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          _nickname(),
        ],
      )),
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: () {
            //validation
            var signupUser =
                KUser(uid: widget.uid, nickname: nicknameController.text);
            AuthController.to.signup(signupUser);
          },
          child: const Text('회원가입'),
        ),
      ),
    );
  }
}
