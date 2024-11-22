import 'package:firebase_messaging/firebase_messaging.dart';

class Fcm{
  static FirebaseMessaging messaging=FirebaseMessaging.instance;
  static Future<void>fcmInit()async{
await requestPerrmission();
await getToken();
  }
  static Future<void>requestPerrmission()async{


    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }
  static  Future<void>getToken()async{
    String?token=await messaging.getToken();
    print("Token is ${token}");
  }
}