// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {String name,
      String uid,
      String email,
      String image,
      @JsonKey(ignore: true) DocumentReference documentReference}) {
    return _User(
      name: name,
      uid: uid,
      email: email,
      image: image,
      documentReference: documentReference,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  String get name;
  String get uid;
  String get email;
  String get image;
  @JsonKey(ignore: true)
  DocumentReference get documentReference;

  Map<String, dynamic> toJson();
  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String uid,
      String email,
      String image,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object name = freezed,
    Object uid = freezed,
    Object email = freezed,
    Object image = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      uid: uid == freezed ? _value.uid : uid as String,
      email: email == freezed ? _value.email : email as String,
      image: image == freezed ? _value.image : image as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String uid,
      String email,
      String image,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object name = freezed,
    Object uid = freezed,
    Object email = freezed,
    Object image = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_User(
      name: name == freezed ? _value.name : name as String,
      uid: uid == freezed ? _value.uid : uid as String,
      email: email == freezed ? _value.email : email as String,
      image: image == freezed ? _value.image : image as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

@JsonSerializable()
class _$_User extends _User with DiagnosticableTreeMixin {
  _$_User(
      {this.name,
      this.uid,
      this.email,
      this.image,
      @JsonKey(ignore: true) this.documentReference})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String name;
  @override
  final String uid;
  @override
  final String email;
  @override
  final String image;
  @override
  @JsonKey(ignore: true)
  final DocumentReference documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(name: $name, uid: $uid, email: $email, image: $image, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('documentReference', documentReference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.documentReference, documentReference) ||
                const DeepCollectionEquality()
                    .equals(other.documentReference, documentReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(documentReference);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User extends User {
  _User._() : super._();
  factory _User(
      {String name,
      String uid,
      String email,
      String image,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get name;
  @override
  String get uid;
  @override
  String get email;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  DocumentReference get documentReference;
  @override
  _$UserCopyWith<_User> get copyWith;
}
