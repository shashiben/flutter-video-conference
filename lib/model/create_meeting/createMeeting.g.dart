// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createMeeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateMeeting _$_$_CreateMeetingFromJson(Map<String, dynamic> json) {
  return _$_CreateMeeting(
    name: json['name'] as String,
    uid: json['uid'] as String,
    title: json['title'] as String,
    password: json['password'] as String,
    timeStamp: json['timeStamp'] == null
        ? null
        : DateTime.parse(json['timeStamp'] as String),
    image: json['image'] as String,
    appID: json['appID'] as String,
    private: json['private'] as bool,
    audio: json['audio'] as bool,
    video: json['video'] as bool,
  );
}

Map<String, dynamic> _$_$_CreateMeetingToJson(_$_CreateMeeting instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'title': instance.title,
      'password': instance.password,
      'timeStamp': instance.timeStamp?.toIso8601String(),
      'image': instance.image,
      'appID': instance.appID,
      'private': instance.private,
      'audio': instance.audio,
      'video': instance.video,
    };
