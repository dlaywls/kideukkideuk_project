import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/pages/board/boardSecondPage.dart';

class WritePage extends StatelessWidget {
  const WritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "글 쓰기",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF241701),
          ),
        ),
        elevation: 0.5,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0), // 선의 높이
          child: Container(
            height: 1.0,
            color: const Color(0xFFD4D4D4), // 선의 색상
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9E9E9E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 0,
              //fixedSize: const Size(54, 28),
            ),
            child: const Text(
              "완료",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ).marginOnly(top: 13, right: 13, bottom: 8),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: '제목',
              hintStyle: TextStyle(color: Color(0xff9E9E9E)),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          TextFormField(
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              hintText: '내용을 입력하세요',
              hintStyle: TextStyle(color: Color(0xff9E9E9E)),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
