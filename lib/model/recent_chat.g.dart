// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecentChat _$_$_RecentChatFromJson(Map<String, dynamic> json) {
  return _$_RecentChat(
    name: json['name'] as String,
    uid: json['uid'] as String,
    lastMessage: json['lastMessage'] as String,
    image: json['image'] as String,
    timeStamp: json['timeStamp'] as String,
  );
}

Map<String, dynamic> _$_$_RecentChatToJson(_$_RecentChat instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'lastMessage': instance.lastMessage,
      'image': instance.image,
      'timeStamp': instance.timeStamp,
    };
