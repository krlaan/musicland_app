import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/image_constants.dart';
import 'package:musicland_app/state/constants/supabase_constants.dart';
import 'package:musicland_app/state/post_settings/models/post_setting.dart';
import 'package:musicland_app/state/posts/models/post_payload.dart';
import 'package:musicland_app/typedef/is_loading.dart';
import 'package:musicland_app/typedef/user_id.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image/image.dart' as img;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

part 'image_upload_provider.g.dart';

@riverpod
class ImageUpload extends _$ImageUpload {
  @override
  IsLoading build() => false;

  set isLoading(IsLoading value) => state = value;

  Future<bool> upload({
    required File file,
    required String message,
    required Map<PostSetting, bool> postSettings,
    required UserId userId,
  }) async {
    isLoading = true;

    // Create a thumbnail from the image
    final fileAsImage = img.decodeImage(file.readAsBytesSync());
    if (fileAsImage == null) {
      isLoading = false;
      return false;
    }

    final thumbnail = img.copyResize(
      fileAsImage,
      width: ImageConstants.imageThumbnailWidth,
    );
    final thumbnailData = img.encodeJpg(thumbnail);
    Uint8List thumbnailUint8List = Uint8List.fromList(thumbnailData);

    // Generate a unique file name
    final fileName = const Uuid().v4();

    try {
      // Create reference for thumbnail
      final String thumbnailRef = await Supabase.instance.client.storage
          .from(SupabaseConstants.users)
          .uploadBinary(
            "/$userId/${SupabaseConstants.thumbnails}/$fileName.jpg",
            thumbnailUint8List,
          );

      String thumbnailUrl = SupabaseConstants.downloadUrl + thumbnailRef;

      // Create reference for image
      final String imageRef = await Supabase.instance.client.storage
          .from(SupabaseConstants.users)
          .upload("/$userId/${SupabaseConstants.images}/$fileName.jpg", file);

      String imageUrl = SupabaseConstants.downloadUrl + imageRef;

      // Create a new post
      final postPayload = PostPayload(
        userId: userId,
        message: message,
        thumbnailUrl: thumbnailUrl,
        fileUrl: imageUrl,
        fileName: fileName,
        thumbnailStorageId: thumbnailRef,
        originalFileStorageId: imageRef,
        postSettings: postSettings,
      );

      /*
     Use it when you decide to use Post Freezed class
     Post post = Post(
        uid: userId,
        fileUrl: imageUrl,
        aspectRatio: 1,
        fileType: FileType.image,
        fileName: fileName,
        postSettings: postSettings,
        createdAt: null,
        message: message,
        thumbnailUrl: thumbnailUrl,
        originalFileStorageId: imageRef,
        thumbnailStorageId: thumbnailRef,
      );*/

      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.posts)
          .add(postPayload);

      return true;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
