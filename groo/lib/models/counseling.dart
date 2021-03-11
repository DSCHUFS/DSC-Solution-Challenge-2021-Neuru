import 'package:cloud_firestore/cloud_firestore.dart';

class CounselingInfo {
  final String name;
  final String keyword;
  final String profile;
  final String oneLine;
  final bool like;
  final bool list;
  final DocumentReference reference;

  CounselingInfo.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        keyword = map['keyword'],
        profile = map['profile'],
        like = map['like'],
        list = map['list'],
        oneLine = map['oneLine'];

  CounselingInfo.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Counseling<$name:$keyword>";
}
