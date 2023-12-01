import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  String icon;
  final double? width;
  ImageData(
    this.icon, {
    Key? key,
    this.width = 55,
    required int size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(icon, width: width! / Get.mediaQuery.devicePixelRatio);
  }
}

// svg file 은 이거 할 필요 x
class IconsPath {
  static String get homeOff => 'assets/images/bottom_nav_home_off.png';
  static String get homeOn => 'assets/images/bottom_nav_home_on.png';
  static String get infoOff => 'assets/images/bottom_nav_info_off_icon.png';
  static String get infoOn => 'assets/images/bottom_nav_info_on_icon.png';
  static String get boardOff => 'assets/images/bottom_nav_board_off_icon.png';
  static String get boardOn => 'assets/images/bottom_nav_board_on_icon.png';
  static String get alarmOff => 'assets/images/bottom_nav_alarm_off_icon.png';
  static String get alarmOn => 'assets/images/bottom_nav_alarm_on_icon.png';
  static String get mypageOff => 'assets/images/bottom_nav_mypage_off_icon.png';
  static String get write => 'assets/images/icon_write.png';
  static String get logo => 'assets/images/home_logo.png';
  static String get numberOfLike => 'assets/images/icon_number_of_like.png';
  static String get numberOfComments =>
      'assets/images/icon_number_of_comments.png';
  static String get commentNotification =>
      'assets/images/icon_commnet_notification.png';
  static String get likeButton => 'assets/images/icon_like_button.png';
  static String get commentSendButton =>
      'assets/images/button_send_comment.png';
  static String get linkIcon1 => 'assets/images/icon_link_1.png';
  static String get linkIcon2 => 'assets/images/icon_link_2.png';
  static String get linkIcon3 => 'assets/images/icon_link_3.png';
  static String get linkIcon4 => 'assets/images/icon_link_4.png';
  static String get linkIcon5 =>
      'assets/images/arrow_button.png'; //여기까지 키득키득 이미지 파일
  static String get postMoreIcon => 'assets/images/more_icon.jpg';

  static String get homeSearch => 'assets/images/home_button_search.png';
  static String get tapHomeOn => 'assets/images/tap_home.png';
  static String get homeWorkIcon => 'assets/images/home_work.png';
  static String get homeHealthIcon => 'assets/images/home_health.png';
  static String get homeUnivIcon => 'assets/images/home_univ.png';
  static String get logoText => 'assets/images/logo_text.png';

  static String get backButton => 'assets/imgages/button_back.png';
}
//>>>>>>> main
