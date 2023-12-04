/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logout extends StatefulWidget {
  final String edit;

  const Logout({Key? key, required this.edit}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // 이메일을 현재 이메일로 미리 채우기
    _emailController.text = 'kideukideuk@gmail.com';
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios, // 뒤로가기 아이콘
            color: Colors.brown, // 아이콘 색상
          ),
          onPressed: () {
            Navigator.pop(context); // 현재 페이지에서 뒤로가기
          },
        ),
        centerTitle: true, // 타이틀 가운데 정렬
          title: const Text(
                '로그아웃',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )
              ).paddingOnly(left: 10)
          ),

      body: Center(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '로그아웃 하시겠습니까?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            
            // 로그아웃 버튼
            ElevatedButton(
              onPressed: () {
                
                await _handleSignOut();
                // 예를 들어 Navigator.pop(context)로 현재 페이지로 돌아갈 수 있습니다.
                Navigator.pop(context); // 현재 페이지 닫기
                _showSnackBar('로그아웃 되었습니다.');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF52B160), // 버튼 색상 변경
              ),
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
      )
    );
  }
}
*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kideukkideuk_project/root.dart';

class Logout extends StatelessWidget {
  const Logout(String edit, {Key? key}) : super(key: key);

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF52B160),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios, // 뒤로가기 아이콘
            color: Colors.brown, // 아이콘 색상
          ),
          onPressed: () {
            Navigator.pop(context); // 현재 페이지에서 뒤로가기
          },
        ),
        centerTitle: true, // 타이틀 가운데 정렬
          title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )
              ).paddingOnly(left: 10)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '로그아웃 하시겠습니까?',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await signOut();
                Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context) => const Root()),
                );

                //Navigator.pop(context); // 로그아웃 후 현재 화면 닫기
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
              ),
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}


