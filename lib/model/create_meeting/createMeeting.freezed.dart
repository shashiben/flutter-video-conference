// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'createMeeting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CreateMeeting _$CreateMeetingFromJson(Map<String, dynamic> json) {
  return _CreateMeeting.fromJson(json);
}

class _$CreateMeetingTearOff {
  const _$CreateMeetingTearOff();

  _CreateMeeting call(
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
      @JsonKey(ignore: true) DocumentReference documentReference}) {
    return _CreateMeeting(
      name: name,
      uid: uid,
      title: title,
      password: password,
      timeStamp: timeStamp,
      image: image,
      appID: appID,
      private: private,
      audio: audio,
      video: video,
      documentReference: documentReference,
    );
  }
}

// ignore: unused_element
const $CreateMeeting = _$CreateMeetingTearOff();

mixin _$CreateMeeting {
  String get name;
  String get uid;
  String get title;
  String get password;
  DateTime get timeStamp;
  String get image;
  String get appID;
  bool get private;
  bool get audio;
  bool get video;
  @JsonKey(ignore: true)
  DocumentReference get documentReference;

  Map<String, dynamic> toJson();
  $CreateMeetingCopyWith<CreateMeeting> get copyWith;
}

abstract class $CreateMeetingCopyWith<$Res> {
  factory $CreateMeetingCopyWith(
          CreateMeeting value, $Res Function(CreateMeeting) then) =
      _$CreateMeetingCopyWithImpl<$Res>;
  $Res call(
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
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class _$CreateMeetingCopyWithImpl<$Res>
    implements $CreateMeetingCopyWith<$Res> {
  _$CreateMeetingCopyWithImpl(this._value, this._then);

  final CreateMeeting _value;
  // ignore: unused_field
  final $Res Function(CreateMeeting) _then;

  @override
  $Res call({
    Object name = freezed,
    Object uid = freezed,
    Object title = freezed,
    Object password = freezed,
    Object timeStamp = freezed,
    Object image = freezed,
    Object appID = freezed,
    Object private = freezed,
    Object audio = freezed,
    Object video = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      uid: uid == freezed ? _value.uid : uid as String,
      title: title == freezed ? _value.title : title as String,
      password: password == freezed ? _value.password : password as String,
      timeStamp:
          timeStamp == freezed ? _value.timeStamp : timeStamp as DateTime,
      image: image == freezed ? _value.image : image as String,
      appID: appID == freezed ? _value.appID : appID as String,
      private: private == freezed ? _value.private : private as bool,
      audio: audio == freezed ? _value.audio : audio as bool,
      video: video == freezed ? _value.video : video as bool,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

abstract class _$CreateMeetingCopyWith<$Res>
    implements $CreateMeetingCopyWith<$Res> {
  factory _$CreateMeetingCopyWith(
          _CreateMeeting value, $Res Function(_CreateMeeting) then) =
      __$CreateMeetingCopyWithImpl<$Res>;
  @override
  $Res call(
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
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class __$CreateMeetingCopyWithImpl<$Res>
    extends _$CreateMeetingCopyWithImpl<$Res>
    implements _$CreateMeetingCopyWith<$Res> {
  __$CreateMeetingCopyWithImpl(
      _CreateMeeting _value, $Res Function(_CreateMeeting) _then)
      : super(_value, (v) => _then(v as _CreateMeeting));

  @override
  _CreateMeeting get _value => super._value as _CreateMeeting;

  @override
  $Res call({
    Object name = freezed,
    Object uid = freezed,
    Object title = freezed,
    Object password = freezed,
    Object timeStamp = freezed,
    Object image = freezed,
    Object appID = freezed,
    Object private = freezed,
    Object audio = freezed,
    Object video = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_CreateMeeting(
      name: name == freezed ? _value.name : name as String,
      uid: uid == freezed ? _value.uid : uid as String,
      title: title == freezed ? _value.title : title as String,
      password: password == freezed ? _value.password : password as String,
      timeStamp:
          timeStamp == freezed ? _value.timeStamp : timeStamp as DateTime,
      image: image == freezed ? _value.image : image as String,
      appID: appID == freezed ? _value.appID : appID as String,
      private: private == freezed ? _value.private : private as bool,
      audio: audio == freezed ? _value.audio : audio as bool,
      video: video == freezed ? _value.video : video as bool,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

@JsonSerializable()
class _$_CreateMeeting extends _CreateMeeting with DiagnosticableTreeMixin {
  _$_CreateMeeting(
      {this.name,
      this.uid,
      this.title,
      this.password,
      this.timeStamp,
      this.image,
      this.appID,
      this.private,
      this.audio,
      this.video,
      @JsonKey(ignore: true) this.documentReference})
      : super._();

  factory _$_CreateMeeting.fromJson(Map<String, dynamic> json) =>
      _$_$_CreateMeetingFromJson(json);

  @override
  final String name;
  @override
  final String uid;
  @override
  final String title;
  @override
  final String password;
  @override
  final DateTime timeStamp;
  @override
  final String image;
  @override
  final String appID;
  @override
  final bool private;
  @override
  final bool audio;
  @override
  final bool video;
  @override
  @JsonKey(ignore: true)
  final DocumentReference documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateMeeting(name: $name, uid: $uid, title: $title, password: $password, timeStamp: $timeStamp, image: $image, appID: $appID, private: $private, audio: $audio, video: $video, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateMeeting'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('timeStamp', timeStamp))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('appID', appID))
      ..add(DiagnosticsProperty('private', private))
      ..add(DiagnosticsProperty('audio', audio))
      ..add(DiagnosticsProperty('video', video))
      ..add(DiagnosticsProperty('documentReference', documentReference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreateMeeting &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.timeStamp, timeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.timeStamp, timeStamp)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.appID, appID) ||
                const DeepCollectionEquality().equals(other.appID, appID)) &&
            (identical(other.private, private) ||
                const DeepCollectionEquality()
                    .equals(other.private, private)) &&
            (identical(other.audio, audio) ||
                const DeepCollectionEquality().equals(other.audio, audio)) &&
            (identical(other.video, video) ||
                const DeepCollectionEquality().equals(other.video, video)) &&
            (identical(other.documentReference, documentReference) ||
                const DeepCollectionEquality()
                    .equals(other.documentReference, documentReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(timeStamp) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(appID) ^
      const DeepCollectionEquality().hash(private) ^
      const DeepCollectionEquality().hash(audio) ^
      const DeepCollectionEquality().hash(video) ^
      const DeepCollectionEquality().hash(documentReference);

  @override
  _$CreateMeetingCopyWith<_CreateMeeting> get copyWith =>
      __$CreateMeetingCopyWithImpl<_CreateMeeting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CreateMeetingToJson(this);
  }
}

abstract class _CreateMeeting extends CreateMeeting {
  _CreateMeeting._() : super._();
  factory _CreateMeeting(
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
      _$_CreateMeeting;

  factory _CreateMeeting.fromJson(Map<String, dynamic> json) =
      _$_CreateMeeting.fromJson;

  @override
  String get name;
  @override
  String get uid;
  @override
  String get title;
  @override
  String get password;
  @override
  DateTime get timeStamp;
  @override
  String get image;
  @override
  String get appID;
  @override
  bool get private;
  @override
  bool get audio;
  @override
  bool get video;
  @override
  @JsonKey(ignore: true)
  DocumentReference get documentReference;
  @override
  _$CreateMeetingCopyWith<_CreateMeeting> get copyWith;
}
