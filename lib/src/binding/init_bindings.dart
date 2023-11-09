// app이 실행되는 순간 인스턴스로 올라감

import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/components/controller/bottom_nav_controller.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}