class CreateMeeting {
  final String? roomId;
  final String? timeStamp;
  final String? endAt;
  final String? uid;
  final String? code;
  final String? name;

  const CreateMeeting(
      {this.roomId,
      this.timeStamp,
      this.endAt,
      this.uid,
      this.code,
      this.name});

  static CreateMeeting fromMap(Map<String, dynamic> data) {
    return CreateMeeting(
        roomId: data["roomId"],
        uid: data["uid"],
        name: data["name"],
        timeStamp: data["timeStamp"],
        code: data["code"],
        endAt: data["endAt"]);
  }

  static Map<String, dynamic> toJson(CreateMeeting cm) {
    return {
      "roomId": cm.roomId,
      "uid": cm.uid,
      "code": cm.code,
      "name": cm.name,
      "timeStamp": cm.timeStamp,
      "endAt": cm.endAt
    };
  }
}
