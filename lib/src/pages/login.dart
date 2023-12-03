import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Google 로그인 중 오류 발생: $e");
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF52B160), // 배경색 설정
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 이미지 추가
            Container(
              width: 200, // 이미지의 폭 설정
              height: 200, // 이미지의 높이 설정
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/home_logo.png'), // 이미지 파일 경로 설정
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20), // 이미지와 버튼 간의 간격 조절
            ElevatedButton(
              onPressed: signInWithGoogle,
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // 버튼 배경색
                onPrimary: Colors.black, // 버튼 글씨색
              ),
              child: const Text('Google 계정으로 로그인'), // 버튼 텍스트
            ),
          ],
        ),
      ),
    );
  }
}
