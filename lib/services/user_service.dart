import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:video_conference/model/user.dart';

@lazySingleton
class UserService {
  final _userRef = Firestore.instance.collection("users");
  Future saveUser(User user) async {
    try {
      await _userRef.document(user.uid).setData(user.toJson());
      return "success";
    } catch (e) {
      return e?.message ?? "Something went wrong! Try again later";
    }
  }

  Future getUserdata(String uid) async {
    try {
      var data = await _userRef.document(uid).get();
      return User.fromDocument(data);
    } catch (e) {
      return e?.message ?? "Something went wrong! Try again later";
    }
  }
}
