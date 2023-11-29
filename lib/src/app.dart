import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kideukkideuk_project/src/controller/bottom_nav_controller.dart';
import 'package:kideukkideuk_project/src/components/image_data.dart';
import 'package:kideukkideuk_project/src/pages/alarm.dart';
import 'package:kideukkideuk_project/src/pages/board/board.dart';
import 'package:kideukkideuk_project/src/pages/home/home1.dart';
import 'package:kideukkideuk_project/src/pages/information/inform.dart';
import 'package:kideukkideuk_project/src/pages/mypage/mypage.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPopAction,
      child: Obx(
        () => Scaffold(
          // backgroundColor: Colors.blue, // 만약 배경화면 색 있다면 바꾸기
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const Home1(),
              const Inform(),
              const Board(),
              Alarm(),
              const Mypage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // label 없이 아이콘만 보여주기
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(
              color: Color(0x00402a05),
              fontSize: 10, // 선택된 텍스트 색상
            ),
            unselectedLabelStyle: const TextStyle(
              color: Color(0x009e9e9e),
              fontSize: 10, // 선택되지 않은 텍스트 색상
            ),

            // 기본 활성화 창 설정 (0 = 홈)
            currentIndex: controller.pageIndex.value,
            // 하단 바 띄워진 느낌 없애기 (선 없애기)
            elevation: 0.8,

            onTap: controller.changeBottomNav,

            items: [
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.homeOff, size: 30),
                activeIcon: ImageData(IconsPath.homeOn, size: 30),
                //activeIcon: ImageData(IconsPath.tapHomeOn, size: 65),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.infoOff, size: 30),
                activeIcon: ImageData(IconsPath.infoOn, size: 30),
                label: '정보 링크',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.boardOff, size: 30),
                activeIcon: ImageData(IconsPath.boardOn, size: 30),
                label: '게시판',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.alarmOff, size: 30),
                activeIcon: ImageData(IconsPath.alarmOn, size: 30),
                label: '알림',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.mypageOff, size: 30),
                label: '마이',
              )
            ],
          ),
        ),
      ),
    );
  }
}
