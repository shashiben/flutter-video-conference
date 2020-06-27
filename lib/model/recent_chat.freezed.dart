// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'recent_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RecentChat _$RecentChatFromJson(Map<String, dynamic> json) {
  return _RecentChat.fromJson(json);
}

class _$RecentChatTearOff {
  const _$RecentChatTearOff();

  _RecentChat call(
      {String name,
      String uid,
      String lastMessage,
      String image,
      String timeStamp,
      @JsonKey(ignore: true) DocumentReference documentReference}) {
    return _RecentChat(
      name: name,
      uid: uid,
      lastMessage: lastMessage,
      image: image,
      timeStamp: timeStamp,
      documentReference: documentReference,
    );
  }
}

// ignore: unused_element
const $RecentChat = _$RecentChatTearOff();

mixin _$RecentChat {
  String get name;
  String get uid;
  String get lastMessage;
  String get image;
  String get timeStamp;
  @JsonKey(ignore: true)
  DocumentReference get documentReference;

  Map<String, dynamic> toJson();
  $RecentChatCopyWith<RecentChat> get copyWith;
}

abstract class $RecentChatCopyWith<$Res> {
  factory $RecentChatCopyWith(
          RecentChat value, $Res Function(RecentChat) then) =
      _$RecentChatCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String uid,
      String lastMessage,
      String image,
      String timeStamp,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class _$RecentChatCopyWithImpl<$Res> implements $RecentChatCopyWith<$Res> {
  _$RecentChatCopyWithImpl(this._value, this._then);

  final RecentChat _value;
  // ignore: unused_field
  final $Res Function(RecentChat) _then;

  @override
  $Res call({
    Object name = freezed,
    Object uid = freezed,
    Object lastMessage = freezed,
    Object image = freezed,
    Object timeStamp = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      uid: uid == freezed ? _value.uid : uid as String,
      lastMessage:
          lastMessage == freezed ? _value.lastMessage : lastMessage as String,
      image: image == freezed ? _value.image : image as String,
      timeStamp: timeStamp == freezed ? _value.timeStamp : timeStamp as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

abstract class _$RecentChatCopyWith<$Res> implements $RecentChatCopyWith<$Res> {
  factory _$RecentChatCopyWith(
          _RecentChat value, $Res Function(_RecentChat) then) =
      __$RecentChatCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String uid,
      String lastMessage,
      String image,
      String timeStamp,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class __$RecentChatCopyWithImpl<$Res> extends _$RecentChatCopyWithImpl<$Res>
    implements _$RecentChatCopyWith<$Res> {
  __$RecentChatCopyWithImpl(
      _RecentChat _value, $Res Function(_RecentChat) _then)
      : super(_value, (v) => _then(v as _RecentChat));

  @override
  _RecentChat get _value => super._value as _RecentChat;

  @override
  $Res call({
    Object name = freezed,
    Object uid = freezed,
    Object lastMessage = freezed,
    Object image = freezed,
    Object timeStamp = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_RecentChat(
      name: name == freezed ? _value.name : name as String,
      uid: uid == freezed ? _value.uid : uid as String,
      lastMessage:
          lastMessage == freezed ? _value.lastMessage : lastMessage as String,
      image: image == freezed ? _value.image : image as String,
      timeStamp: timeStamp == freezed ? _value.timeStamp : timeStamp as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

@JsonSerializable()
class _$_RecentChat extends _RecentChat with DiagnosticableTreeMixin {
  _$_RecentChat(
      {this.name,
      this.uid,
      this.lastMessage,
      this.image,
      this.timeStamp,
      @JsonKey(ignore: true) this.documentReference})
      : super._();

  factory _$_RecentChat.fromJson(Map<String, dynamic> json) =>
      _$_$_RecentChatFromJson(json);

  @override
  final String name;
  @override
  final String uid;
  @override
  final String lastMessage;
  @override
  final String image;
  @override
  final String timeStamp;
  @override
  @JsonKey(ignore: true)
  final DocumentReference documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecentChat(name: $name, uid: $uid, lastMessage: $lastMessage, image: $image, timeStamp: $timeStamp, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecentChat'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('lastMessage', lastMessage))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('timeStamp', timeStamp))
      ..add(DiagnosticsProperty('documentReference', documentReference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecentChat &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.lastMessage, lastMessage) ||
                const DeepCollectionEquality()
                    .equals(other.lastMessage, lastMessage)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.timeStamp, timeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.timeStamp, timeStamp)) &&
            (identical(other.documentReference, documentReference) ||
                const DeepCollectionEquality()
                    .equals(other.documentReference, documentReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(lastMessage) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(timeStamp) ^
      const DeepCollectionEquality().hash(documentReference);

  @override
  _$RecentChatCopyWith<_RecentChat> get copyWith =>
      __$RecentChatCopyWithImpl<_RecentChat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RecentChatToJson(this);
  }
}

abstract class _RecentChat extends RecentChat {
  _RecentChat._() : super._();
  factory _RecentChat(
          {String name,
          String uid,
          String lastMessage,
          String image,
          String timeStamp,
          @JsonKey(ignore: true) DocumentReference documentReference}) =
      _$_RecentChat;

  factory _RecentChat.fromJson(Map<String, dynamic> json) =
      _$_RecentChat.fromJson;

  @override
  String get name;
  @override
  String get uid;
  @override
  String get lastMessage;
  @override
  String get image;
  @override
  String get timeStamp;
  @override
  @JsonKey(ignore: true)
  DocumentReference get documentReference;
  @override
  _$RecentChatCopyWith<_RecentChat> get copyWith;
}
