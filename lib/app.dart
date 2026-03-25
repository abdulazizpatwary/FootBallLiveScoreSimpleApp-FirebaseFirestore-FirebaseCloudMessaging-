import 'package:flutter/material.dart';
import 'package:football_live_score_exercise/controller_binder.dart';
import 'package:football_live_score_exercise/presentation/ui/screens/home_live_score.dart';
import 'package:football_live_score_exercise/presentation/ui/screens/up_coming_match.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: ControllerBinder(),
      onGenerateRoute: (setting){
        late Widget widget;
        if(setting.name==HomeLiveScore.name){
          widget = HomeLiveScore();
        }
        if(setting.name==UpComingMatch.name){
          widget = UpComingMatch();
        }
        return MaterialPageRoute(builder: (context)=>widget);
      },
    );
  }
}
