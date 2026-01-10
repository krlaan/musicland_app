import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:musicland_app/state/image_upload/extensions/to_file.dart';

class ImagePickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<File?> pickImageFromGallery() =>
      _imagePicker.pickImage(source: ImageSource.gallery).toFile();

  static Future<File?> pickImageFromCamera() =>
      _imagePicker.pickImage(source: ImageSource.camera).toFile();
}
