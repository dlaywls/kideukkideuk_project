import 'package:flutter/material.dart';

class Nickname extends StatefulWidget {
  final String edit;

  const Nickname({Key? key, required this.edit}) : super(key: key);

  @override
  _NicknameState createState() => _NicknameState();
}

class _NicknameState extends State<Nickname> {
  final TextEditingController _nicknameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // 닉네임을 현재 닉네임으로 미리 채우기
    _nicknameController.text = '키득이';
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
        title: Text(widget.edit),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 기존 닉네임 표시
            const Text(
              '현재 닉네임: 키득이',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // 수정 가능한 텍스트 필드
            TextField(
              controller: _nicknameController,
              decoration: const InputDecoration(
                labelText: '새 닉네임',
              ),
            ),
            const SizedBox(height: 20),
            // 저장 버튼
            ElevatedButton(
              onPressed: () {
                // 닉네임 저장 로직 추가 해야함


                String newNickname = _nicknameController.text;
                // 저장 후 페이지 이동 또는 다른 작업 수행
                // 예를 들어 Navigator.pop(context)로 현재 페이지로 돌아갈 수 있습니다.
                Navigator.pop(context); // 현재 페이지 닫기
                _showSnackBar('닉네임이 변경되었습니다.');
              },
              child: const Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}
