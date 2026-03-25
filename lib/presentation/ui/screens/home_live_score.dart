import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:football_live_score_exercise/data/models/live_model.dart';
import 'package:football_live_score_exercise/presentation/ui/controller/home_live_controller.dart';
import 'package:football_live_score_exercise/presentation/ui/screens/up_coming_match.dart';
import 'package:get/get.dart';
import 'package:slider_button/slider_button.dart';

class HomeLiveScore extends StatefulWidget {
  const HomeLiveScore({super.key});

  static const String name = '/';

  @override
  State<HomeLiveScore> createState() => _HomeLiveScoreState();
}

class _HomeLiveScoreState extends State<HomeLiveScore> {
  HomeLiveController _homeLiveController = Get.find<HomeLiveController>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<LiveModel> _footballScoreList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_homeLiveController.getliveScore('football');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Live Score'), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: db.collection('football').snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.hasData) {
                    QuerySnapshot<Map<String, dynamic>> querySnapshot = snapshot.data! as QuerySnapshot<Map<String,dynamic>>;
                    getData(querySnapshot);
                    return ListView.builder(
                      itemCount: _footballScoreList.length,
                      itemBuilder: (context, index) {
                        LiveModel model = _footballScoreList[index];
                        return ListTile(
                          title: Text(model.matchId),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${model.team1} vs ${model.team2}'),
                              if (!model.isrunning)
                                Text('Winner is ${model.winner_team}'),
                            ],
                          ),
                          trailing: Text(
                            '${model.team1_score}-${model.team2_score}',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          leading: CircleAvatar(
                            radius: 8,
                            backgroundColor: model.isrunning
                                ? Colors.green
                                : Colors.grey,
                          ),
                        );
                      },
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
            SliderButton(action: ()async{
              Get.toNamed(UpComingMatch.name);
              return false;
            },
              backgroundColor: Colors.blue,
              label: Text('Next Screen'),
              //radius: 20,
              //buttonWidth: 120,
              buttonSize: 70,
              buttonColor: Colors.blue,
              dismissThresholds: 0.75,




              width: size.width*0.80,
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0,),
                child: Text(' > > >',style: TextStyle(fontSize: 32,color: Colors.white,backgroundColor: Colors.blue),),
              ),
            ),
            SizedBox(height: 56,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: addMatchScore,child: Icon(Icons.add),),
    );
  }
  void addMatchScore(){
    Map<String,dynamic> requestData = {
      'isrunning':false,
      'team-1':'Korea',
      'team-2':'England',
      'team1-score':0,
      'team2-score':4,
      'winner-team':'England',
    };
    LiveModel model = LiveModel.fromJson(requestData, 'kovseng');
    // db.collection('football').doc(model.matchId).set(model.toJson());
    //db.collection('football').doc(model.matchId).update(model.toJson());
    db.collection('football').doc(model.matchId).delete();
  }

  void getData(QuerySnapshot<Map<String, dynamic>> querysnapshot) {
    _footballScoreList.clear();
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc
        in querysnapshot.docs) {
      _footballScoreList.add(LiveModel.fromJson(doc.data(), doc.id));
    }
  }
}
