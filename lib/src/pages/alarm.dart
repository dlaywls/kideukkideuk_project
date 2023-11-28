import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kideukkideuk_project/src/controller/auth_controller.dart';
import 'package:kideukkideuk_project/src/controller/notification_controller.dart';
import 'package:kideukkideuk_project/src/pages/board/commentPage.dart';
import 'package:kideukkideuk_project/src/models/notification.dart'
    as ProjectNotification;

class Alarm extends StatelessWidget {
  Alarm({Key? key}) : super(key: key);

  final NotificationController _notificationController =
      Get.put(NotificationController());
  final AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    _notificationController.fetchNotifications();

    return Scaffold(
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '알림',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF241701),
            ),
          ).paddingOnly(top: 40, left: 30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD2D2D2)), // 테두리 속성
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(17),
                    topRight: Radius.circular(17)), // 테두리의 모서리를 둥글게
              ),
              margin: const EdgeInsets.only(
                  top: 20, right: 20, left: 20), // 테두리 주변의 간격
              child: ListView.builder(
                itemCount: _notificationController.notifications.length,
                itemBuilder: (context, index) {
                  ProjectNotification.Notification notification =
                      _notificationController.notifications[index];
                  String language;
                  int? id = notification.boardId;
                  switch (id) {
                    case 0:
                      language = '한국어';
                      break;
                    case 1:
                      language = '영어';
                      break;
                    case 2:
                      language = '일본어';
                      break;
                    case 3:
                      language = '중국어';
                      break;
                    case 4:
                      language = '베트남어';
                      break;
                    case 5:
                      language = '스페인어';
                      break;
                    case 6:
                      language = '러시아어';
                      break;
                    case 7:
                      language = '프랑스어';
                      break;
                    case 8:
                      language = '독일어';
                      break;
                    case 9:
                      language = '아랍어';
                      break;
                    case 10:
                      language = '터키어';
                      break;
                    case 11:
                      language = '말레이어';
                      break;
                    default:
                      language = '기타';
                  }

                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          backgroundImage: const AssetImage(
                              'assets/images/icon_commnet_notification.png'),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black, // 테두리 색상
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFFD4D4D4), // 테두리 색상
                                width: 1.0, // 테두리 두께
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          '[ ${language} 게시판 ]',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF170F01),
                          ),
                        ),
                        subtitle: Text(
                          notification.contents ?? " 정보 없음 ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF170F01),
                          ),
                        ),

                        // 각 항목을 눌렀을 때 해당 항목의 세부 페이지로 이동
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentPage(
                                  title: "알람이다.",
                                  content: "알람이다.",
                                  language: "한국어",
                                  likeCount: 0,
                                  commentCount: 0,
                                  postId: ""),
                            ),
                          );
                        },
                      ),
                      // 구분선 추가
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
