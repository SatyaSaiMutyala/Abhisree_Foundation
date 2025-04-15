

import 'package:adhisree_foundation/notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('TITLE ***${message.notification?.title}');
  print('BODY ***${message.notification?.body}');
  print('PAYLOAD ***${message.data}');

}

void handleMessage(RemoteMessage? message) {
  if(message == null) return;
  Get.offAll(() => NotificationsScreen(message: message) );
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true
  );
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final FCMToken = await _firebaseMessaging.getToken();
    print('FCM TOKEN ****************${FCMToken}');
    initPushNotifications();
  }

}