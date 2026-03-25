import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_live_score_exercise/data/networkcaller/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url)async{
    FirebaseFirestore db= FirebaseFirestore.instance;
    QuerySnapshot<Map<String,dynamic>> snapshot=await db.collection(url).get();
    if(snapshot.docs.isNotEmpty){
      return NetworkResponse(isSuccess: true, statusCode: 200,resposeData: snapshot);
    }else{
      return NetworkResponse(isSuccess: false, statusCode: -1,errorMsg: 'data not found');
    }

  }
}