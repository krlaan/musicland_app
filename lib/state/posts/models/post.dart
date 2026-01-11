import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicland_app/state/post_settings/models/post_setting.dart';
import 'package:musicland_app/state/posts/models/post_key.dart';

// This is fromJson to convert data from Firestore to Post class.
// Using the commented out code below, we can have post_payload.dart and Post.dart in one class as toJson and FromJson are in the same file.
class Post {
  final String postId;
  final String userId;
  final String message;
  final DateTime createdAt;
  final Map<PostSetting, bool> postSettings;

  Post({
    required this.postId,
    required Map<String, dynamic> json,
  })  : userId = json[PostKey.userId],
        message = json[PostKey.message],
        createdAt = (json[PostKey.createdAt] as Timestamp).toDate(),
        postSettings = {
          for (final entry in json[PostKey.postSettings].entries)
            if (PostSetting.values.any((e) => e.storageKey == entry.key))
              PostSetting.values.firstWhere(
                (element) => element.storageKey == entry.key,
              ): entry.value,
        };

  bool get allowsLikes => postSettings[PostSetting.allowLikes] ?? false;
}
