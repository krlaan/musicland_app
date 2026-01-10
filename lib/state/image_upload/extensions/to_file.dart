import 'dart:io';
import 'package:image_picker/image_picker.dart';

/// Extension on `Future<XFile?>` to convert an `XFile` (from `image_picker`)
/// to a `File` object.
/// This simplifies handling the conversion from the `image_picker` package
/// which provides `XFile` objects, whereas many Dart/Flutter APIs work with `File` objects.
extension ToFile on Future<XFile?> {
  /// Converts a `Future<XFile?>` to a `Future<File?>`.
  ///
  /// - If the `XFile` is not null, its path is used to create a `File` object.
  /// - If the `XFile` is null, the resulting `Future` resolves to null.
  Future<File?> toFile() => then(
        (xFile) => xFile
        ?.path, // Get the file path from the XFile, or null if XFile is null.
  ).then(
        (filePath) => filePath != null
        ? File(filePath)
        : null, // Create a File object if the path is not null, otherwise return null.
  );
}
