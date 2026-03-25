class LiveModel {
  final bool isrunning;
  final String team1;
  final String team2;
  final String team1_score;
  final String team2_score;
  final String winner_team;
  final String matchId;

  LiveModel({
    required this.isrunning,
    required this.team1,
    required this.team2,
    required this.team1_score,
    required this.team2_score,
    required this.winner_team,
    required this.matchId,
  });

  factory LiveModel.fromJson(Map<String, dynamic> json, String matchId) {
    return LiveModel(
      isrunning: json['isrunning'],
      team1: json['team-1'],
      team2: json['team-2'],
      team1_score: json['team1-score'].toString(),
      team2_score: json['team2-score'].toString(),
      winner_team: json['winner-team']??'',
      matchId: matchId,
    );
  }
  Map<String,dynamic>toJson(){
    return {
      'isrunning':isrunning,
      'team-1':team1,
      'team-2':team2,
    'team1-score':team1_score,
    'team2-score':team2_score,
    'winner-team':winner_team
    };
  }
}
