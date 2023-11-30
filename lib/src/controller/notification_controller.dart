import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kideukkideuk_project/src/models/notification.dart';
import 'package:kideukkideuk_project/src/repository/nofitication_repository.dart';
import 'package:kideukkideuk_project/src/repository/user_repository.dart';

class NotificationController extends GetxController {
  final NotificationRepository _notificationRepository =
      NotificationRepository();
  //UserRepository _userRepository = UserRepository();
  final RxList<Notification> notifications = <Notification>[].obs;

  Future<void> fetchNotifications() async {
    String? receiverId = await UserRepository.getCurrentUserId();
    List<Notification> fetchedNotifications = await _notificationRepository
        .getNotificationsByReceiverId(receiverId ?? " ");
    notifications.assignAll(fetchedNotifications);
    print("notifications.length ${notifications.length}");
  }
}
