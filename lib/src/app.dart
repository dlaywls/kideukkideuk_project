import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kideukkideuk_project/src/controller/bottom_nav_controller.dart';
import 'package:kideukkideuk_project/src/components/image_data.dart';
import 'package:kideukkideuk_project/src/pages/board.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
        () => Scaffold(
          // backgroundColor: Colors.blue, // 만약 배경화면 색 있다면 바꾸기
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              Container(
                child: Center(child: Text('HOME')),
              ),
              Container(
                child: Center(child: Text('SEARCH')),
              ),
              const Board(),
              Container(
                child: Center(child: Text('UPLOAD')),
              ),
              Container(
                child: Center(child: Text('ACTIVITY')),
              ),
              Container(
                child: Center(child: Text('MYPAGE')),
              ),
            ],
          ),
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

            onTap: controller.changeBottomNav,

            items: [
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.homeOff, size: 30),
                activeIcon: ImageData(IconsPath.homeOn, size: 30),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.infoOff, size: 30),
                activeIcon: ImageData(IconsPath.infoOn, size: 30),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.boardOff, size: 30),
                activeIcon: ImageData(IconsPath.boardOn, size: 30),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.alarmOff, size: 30),
                activeIcon: ImageData(IconsPath.alarmOn, size: 30),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.mypageOff, size: 30),
                label: 'home',
              ),
              /*BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                label: 'home',
              ),*/
            ],
          ),
        ),
      ),
      onWillPop: controller.willPopAction,
    );
  }
}
