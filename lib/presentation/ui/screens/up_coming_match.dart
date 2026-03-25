import 'package:flutter/material.dart';
class UpComingMatch extends StatelessWidget {
  const UpComingMatch({super.key});
  static const String name='upcoming_match';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upcoming match'),backgroundColor: Colors.green,),
    );
  }
}
