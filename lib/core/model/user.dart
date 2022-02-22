class User {
  final String? uid;
  final String? name;
  final String? email;
  final String? username;
  final String? status;
  final int? state;
  final String? profilePhoto;

  const User({
    this.uid,
    this.name,
    this.email,
    this.username,
    this.status,
    this.state,
    this.profilePhoto,
  });

  static Map<String, dynamic> toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['username'] = user.username;
    data["status"] = user.status;
    data["state"] = user.state;
    data["profile_photo"] = user.profilePhoto;
    return data;
  }

  static fromMap(Map<String, dynamic> mapData) {
    return User(
        uid: mapData['uid'],
        name: mapData['name'],
        email: mapData['email'],
        username: mapData['username'],
        status: mapData['status'],
        state: mapData['state'],
        profilePhoto: mapData['profile_photo']);
  }
}
