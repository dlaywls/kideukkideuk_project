import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  bool get isFieldsFilled =>
      titleController.text.isNotEmpty && contentController.text.isNotEmpty;

  void _onCompletePressed() {
    if (isFieldsFilled) {
      Navigator.pop(context);
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "글 쓰기",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF241701),
        ),
      ),
      elevation: 0.5,
      actions: [
        ElevatedButton(
          onPressed: isFieldsFilled ? _onCompletePressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isFieldsFilled
                ? const Color(0xFF52B160)
                : const Color(0xFF9E9E9E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 0,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: titleController,
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              hintText: '제목',
              hintStyle: TextStyle(color: Color(0xff9E9E9E)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD4D4D4)),
              ),
              contentPadding: EdgeInsets.all(5),
            ),
          ),
          TextFormField(
            controller: contentController,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              hintText: '내용을 입력하세요',
              hintStyle: TextStyle(color: Color(0xff9E9E9E)),
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(5),
            ),
          ),
        ],
      ).marginOnly(right: 20, left: 20, top: 18),
    );
  }
}
