// Dart imports:
import 'dart:io';

// Flutter imports:

// Package imports:
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StorageService {
  uploadImage(
      {required File file,
      required String fileName,
      required String collectionName}) async {
    try {
      Reference reference =
          FirebaseStorage.instance.ref(collectionName).child(fileName);
      await reference.putFile(file);
      String imgUrl = await FirebaseStorage.instance
          .ref()
          .child('$collectionName/$fileName')
          .getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}
