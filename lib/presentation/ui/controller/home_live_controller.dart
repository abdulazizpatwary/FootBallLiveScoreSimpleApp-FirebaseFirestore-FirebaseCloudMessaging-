

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_live_score_exercise/data/models/live_model.dart';
import 'package:football_live_score_exercise/data/networkcaller/network_caller.dart';
import 'package:football_live_score_exercise/data/networkcaller/network_response.dart';
import 'package:get/get.dart';

class HomeLiveController extends GetxController{
  bool _inProgress=false;
  bool get inProgress =>_inProgress;
  LiveModel? _liveModel;
  List<LiveModel> _live_listModel=[];
  List<LiveModel> get liveListModel=>_live_listModel;
  Future<void>getliveScore(String url)async{
    _inProgress=true;
    update();
    NetworkResponse response =await NetworkCaller.getRequest(url);
    if(response.isSuccess){
      for(QueryDocumentSnapshot<Map<String,dynamic>> doc in response.resposeData!.docs){
        print(doc);
        _liveModel = LiveModel.fromJson(doc.data(), doc.id);
        _live_listModel.add(_liveModel!);
      }

    }
    _inProgress=false;
    update();

  }

}