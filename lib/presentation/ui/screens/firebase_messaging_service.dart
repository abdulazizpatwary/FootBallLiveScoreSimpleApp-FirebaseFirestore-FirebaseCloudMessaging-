import 'package:firebase_messaging/firebase_messaging.dart';

class FcmMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void>initialize()async{
    await _firebaseMessaging.requestPermission(
      alert: true,
      sound: true,
    );
    //foreground ->> running
    FirebaseMessaging.onMessage.listen(_onForgroundNotification);
    //background -->>  running
    FirebaseMessaging.onMessageOpenedApp.listen(_onBackgroundNotification);
    //terminated -->> app is not running
    FirebaseMessaging.onBackgroundMessage(onBackgroundReceivedNotification);

  }
  void _onForgroundNotification(RemoteMessage message){
    print(message);
    print(message.notification?.title);
    print(message.notification?.body);
    print(message.data);

  }
  void _onBackgroundNotification(RemoteMessage message){
    print(message);
    print(message.notification?.title);
    print(message.notification?.body);
    print(message.data);
  }
  Future<String?> getFcmToken()async{
    return await _firebaseMessaging.getToken();
  }
  void getFcmTokenRefresh(){
      _firebaseMessaging.onTokenRefresh.listen((newToken){
        //api send

      });
  }
}
Future<void> onBackgroundReceivedNotification(RemoteMessage message)async{


}