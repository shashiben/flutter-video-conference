// Dart imports:
import 'dart:io';

// Package imports:
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImagePickerService {
  ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  File? _image;
  pickImageFromCamera() async {
    _imageFile = await _picker.pickImage(source: ImageSource.camera);
    if (_imageFile == null) return;
    _image = File(_imageFile!.path);

    return _image;
  }

  pickImageFromGallery() async {
    _imageFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_imageFile == null) return;
    _image = File(_imageFile!.path);

    return _image;
  }
}
