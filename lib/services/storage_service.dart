import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StorageService {
  uploadImage({@required File image,String uid}) async {
    final StorageReference reference =
        FirebaseStorage.instance.ref().child("profilePic").child(uid);

    StorageUploadTask uploadTask = reference.putFile(image);

    StorageTaskSnapshot snapshot = await uploadTask.onComplete;

    var downloadUrl = await snapshot.ref.getDownloadURL();

    if (uploadTask.isComplete) {
      var url = downloadUrl.toString();
      return url;
    }

    return null;
  }
}
