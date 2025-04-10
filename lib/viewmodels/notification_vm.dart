import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/notification_model.dart';

final notificationViewModelProvider = Provider<NotificationViewModel>((ref) {
  return NotificationViewModel();
});

class NotificationViewModel {
  List<NotificationModel> getNotifications() {
    return [
      NotificationModel(
        title: "Big Deals on Computers",
        description:
            "Shop Now! Accessories, Earphones, Appliances & more under 499!",
        imagePath: 'assets/images/notification.png',
        time: "2 Minutes ago",
      ),
    ];
  }
}
