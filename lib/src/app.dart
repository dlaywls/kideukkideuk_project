import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kideukkideuk_project/src/components/controller/bottom_nav_controller.dart';
import 'package:kideukkideuk_project/src/components/image_data.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        // backgroundColor: Colors.blue, // 만약 배경화면 색 있다면 바꾸기
        appBar: AppBar(),
        body: Container(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // label 없이 아이콘만 보여주기
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // backgoundColor: Colors.blue,

          // 기본 활성화 창 설정 (0 = 홈)
          currentIndex: controller.pageIndex.value,
          // 하단 바 띄워진 느낌 없애기 (선 없애기)
          elevation: 0,

          onTap: (value) {},

          items: [
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.homeOff),
              activeIcon: ImageData(IconsPath.homeOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.searchOff),
              activeIcon: ImageData(IconsPath.searchOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.uploadIcon),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.activeOff),
              activeIcon: ImageData(IconsPath.activeOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              label: 'home',
            ),
          ],
        ),
      ), 
      onWillPop: () async {
        return false; // 앱 종료 x
      }
    );
  }
}