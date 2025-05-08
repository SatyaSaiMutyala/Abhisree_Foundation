import 'package:adhisree_foundation/controllers/SendDeviceTokenController.dart';
import 'package:adhisree_foundation/notification_screen.dart';
import 'package:adhisree_foundation/utils/storageService.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('TITLE ***${message.notification?.title}');
  print('BODY ***${message.notification?.body}');
  print('PAYLOAD ***${message.data}');
}

void handleMessage(RemoteMessage? message) {
  if (message == null) return;
  // Get.offAll(() => NotificationsScreen());
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final storageService = StorageService();
  final SendDeviceTokenController sendDeviceTokenController =
      Get.put(SendDeviceTokenController());

  // Future<void> initNotification() async {
  //   await _firebaseMessaging.requestPermission();
  //   final FCMToken = await _firebaseMessaging.getToken();
  //   print('FCM TOKEN ****************${FCMToken}');

  //   if(FCMToken != null){
  //     await storageService.StoreFcmToken(FCMToken);
  //   }

  Future<void> initNotification() async {
  await _firebaseMessaging.requestPermission();

  try {
    final FCMToken = await _firebaseMessaging.getToken();
    print('FCM TOKEN: $FCMToken');

    if (FCMToken != null) {
      await storageService.StoreFcmToken(FCMToken);
    }
  } catch (e) {
    print(' Failed to get FCM token: $e');
  }

  initPushNotifications();
}

}
