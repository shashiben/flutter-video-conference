import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:video_conference/model/create_meeting/createMeeting.dart';

@lazySingleton
class FirestoreService {
  final CollectionReference _userCollection =
      Firestore.instance.collection("users");
  final CollectionReference _meetingRef =
      Firestore.instance.collection("meetings");
  final StreamController<List<CreateMeeting>> _meetingController =
      StreamController<List<CreateMeeting>>.broadcast();

  Future<bool> createMeeting(CreateMeeting cm) async {
    print("Entered creation of meeting");
    try {
      await _meetingRef.document(cm.title).setData(cm.toJson());
      print("Data entered at creation of meeting");
      return true;
    } catch (e) {
      print("Error occured at creation of meeting");
      return false;
    }
  }

  Stream getMeetings() {
    var query = _meetingRef.orderBy("timeStamp");
    query.snapshots().listen((event) {
      if (event.documents.isNotEmpty) {
        var item =
            event.documents.map((e) => CreateMeeting.fromDocument(e)).toList();
        _meetingController.add(item);
      }
    });
    return _meetingController.stream;
  }
}
