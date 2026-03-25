import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:football_live_score_exercise/presentation/ui/screens/firebase_messaging_service.dart';

import 'app.dart';
import 'firebase_options.dart';
Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FcmMessagingService().getFcmTokenRefresh();
  await FcmMessagingService().initialize();
  print(await FcmMessagingService().getFcmToken());
  runApp(MyApp());
}