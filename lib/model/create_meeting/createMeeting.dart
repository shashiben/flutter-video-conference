import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'createMeeting.freezed.dart';
part 'createMeeting.g.dart';

@freezed
abstract class CreateMeeting implements _$CreateMeeting {
  const CreateMeeting._();
  factory CreateMeeting(
          {String name,
          String uid,
          String title,
          String password,
          DateTime timeStamp,
          String image,
          String appID,
          bool private,
          bool audio,
          bool video,
          @JsonKey(ignore: true) DocumentReference documentReference}) =
      _CreateMeeting;

  factory CreateMeeting.fromJson(Map<String, dynamic> json) =>
      _$CreateMeetingFromJson(json);

  static CreateMeeting fromDocument(DocumentSnapshot document) {
    if (document == null || document.data == null) return null;

    return CreateMeeting(
        timeStamp: document.data['timeStamp'],
        uid: document.data['uid'],
        name: document.data['name'],
        image: document.data['image'],
        title: document.data["title"],
        password: document.data["password"],
        appID: document.data["appId"],
        private: document.data["private"],
        audio: document.data["audio"],
        video: document.data["video"]);
  }

  static CreateMeeting empty() {
    return CreateMeeting(
        uid: '',
        name: '',
        timeStamp: null,
        image: '',
        appID: '',
        title: '',
        password: '',
        audio: false,
        video: false,
        private: false,
        documentReference: null);
  }
}
