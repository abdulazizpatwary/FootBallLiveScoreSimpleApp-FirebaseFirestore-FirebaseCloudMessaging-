import 'package:cloud_firestore/cloud_firestore.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  String errorMsg;
  QuerySnapshot<Map<String, dynamic>>? resposeData;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.errorMsg = 'Something went wrong',
    this.resposeData,
  });
}
