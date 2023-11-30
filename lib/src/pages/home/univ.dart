import 'package:flutter/material.dart';

class Univ extends StatelessWidget {
  const Univ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: const Center(
        child: Text('Content for Page 1'),
      ),
    );
  }
}