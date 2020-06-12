import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User implements _$User {
  const User._();
  factory User(
      {String name,
      String uid,
      String email,
      String image,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static User fromDocument(DocumentSnapshot document) {
    if (document == null || document.data == null) return null;

    return User(
      email: document.data['email'],
      uid: document.data['uid'],
      name: document.data['name'],
      image: document.data['image'],
    );
  }

  static User empty() {
    return User(
        uid: '', name: '', email: '', image: '', documentReference: null);
  }
}
