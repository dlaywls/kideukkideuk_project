import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
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
  bool isNicknameFilled = false;

  Widget _nickname() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // mainAxisSize 설정 추가
        children: [
          const Text(
            '닉네임을 입력해주세요',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ).marginOnly(top: 60, left: 5),
          const SizedBox(height: 12),
          const Text(
            '다시 변경하기 어려우니 신중하게 입력해주세요',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ).marginOnly(left: 5),
          const SizedBox(height: 40),
          Flexible(
            // Flexible로 변경
            child: TextField(
              controller: nicknameController,
              onChanged: (value) {
                setState(() {
                  isNicknameFilled = value.trim().isNotEmpty;
                });
              },
              decoration: InputDecoration(
                hintText: '닉네임 입력하기',
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signupButton() {
    return isNicknameFilled
        ? Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                var signupUser =
                    KUser(uid: widget.uid, nickname: nicknameController.text);
                AuthController.to.signup(signupUser);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF52B160),
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: const Text('가입하기',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          )
        : const SizedBox(); // 텍스트 필드가 비어있으면 빈 SizedBox 반환
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _nickname(),
                  // 다른 필요한 위젯들 추가 가능
                ],
              ),
            ),
          ),
          _signupButton(),
        ],
      ),
    );
  }
}
