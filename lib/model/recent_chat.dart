import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'recent_chat.freezed.dart';
part 'recent_chat.g.dart';

@freezed
abstract class RecentChat implements _$RecentChat {
  const RecentChat._();
  factory RecentChat(
          {String name,
          String uid,
          String lastMessage,
          String image,
          String timeStamp,
          @JsonKey(ignore: true) DocumentReference documentReference}) =
      _RecentChat;

  factory RecentChat.fromJson(Map<String, dynamic> json) =>
      _$RecentChatFromJson(json);

  static RecentChat fromDocument(DocumentSnapshot document) {
    if (document == null || document.data == null) return null;

    return RecentChat(
      lastMessage: document.data['lastMessage'],
      uid: document.data['uid'],
      name: document.data['name'],
      timeStamp: document.data["timeStamp"],
      image: document.data['image'],
    );
  }

  static RecentChat empty() {
    return RecentChat(
        uid: '',
        name: '',
        lastMessage: '',
        image: '',
        documentReference: null,
        timeStamp: '');
  }
}
