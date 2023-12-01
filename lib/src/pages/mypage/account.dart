import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatefulWidget {
  final String edit;

  const Account({Key? key, required this.edit}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
                '이메일 변경',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )
              ).paddingOnly(left: 10)
          ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 기존 이메일 표시
            const Text(
              '현재 이메일: kideukideuk@gmail.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // 수정 가능한 텍스트 필드
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: '새 이메일',
              ),
            ),
            const SizedBox(height: 20),
            // 저장 버튼
            ElevatedButton(
              onPressed: () {
                // 이메일 저장 로직 추가해야함...

                
                String newEmail = _emailController.text;
                // 저장 후 페이지 이동 또는 다른 작업 수행
                // 예를 들어 Navigator.pop(context)로 현재 페이지로 돌아갈 수 있습니다.
                Navigator.pop(context); // 현재 페이지 닫기
                _showSnackBar('이메일이 변경되었습니다.');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF52B160), // 버튼 색상 변경
              ),
              child: const Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}
