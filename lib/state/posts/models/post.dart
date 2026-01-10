import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicland_app/state/image_upload/models/file_type.dart';
import 'package:musicland_app/state/post_settings/models/post_setting.dart';
import 'package:musicland_app/state/posts/models/post_key.dart';

// This is fromJson to convert data from Firestore to Post class.
// Using the commented out code below, we can have post_payload.dart and Post.dart in one class as toJson and FromJson are in the same file.
class Post {
  final String postId;
  final String userId;
  final String message;
  final DateTime createdAt;
  final String thumbnailUrl;
  final String fileUrl;
  final FileType fileType;
  final String fileName;
  final double aspectRatio;
  final String thumbnailStorageId;
  final String originalFileStorageId;
  final Map<PostSetting, bool> postSettings;

  Post({
    required this.postId,
    required Map<String, dynamic> json,
  })  : userId = json[PostKey.userId],
        message = json[PostKey.message],
        createdAt = (json[PostKey.createdAt] as Timestamp).toDate(),
        thumbnailUrl = json[PostKey.thumbnailUrl],
        fileUrl = json[PostKey.fileUrl],
        fileType = FileType.values.firstWhere(
              (fileType) => fileType.name == json[PostKey.fileType],
          orElse: () => FileType.image,
        ),
        fileName = json[PostKey.fileName],
        aspectRatio = json[PostKey.aspectRatio],
        thumbnailStorageId = json[PostKey.thumbnailStorageId],
        originalFileStorageId = json[PostKey.originalFileStorageId],
        postSettings = {
          for (final entry in json[PostKey.postSettings].entries)
            if (PostSetting.values.any((e) => e.storageKey == entry.key))
              PostSetting.values.firstWhere(
                (element) => element.storageKey == entry.key,
              ): entry.value,
        };

  bool get allowsLikes => postSettings[PostSetting.allowLikes] ?? false;
}

/*

For people who are using freezed package, here is the code for the Post model:

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
class Post with _$Post {
  // Needed for custom getters
  const Post._();

  factory Post({
    required String uid,
    @JsonKey(name: PostKey.fileUrl) required String fileUrl,
    @JsonKey(name: PostKey.aspectRatio) required double aspectRatio,
    @JsonKey(name: PostKey.fileType) required FileType fileType,
    @JsonKey(name: PostKey.fileName) required String fileName,
    @PostSettingsConverter()
    @JsonKey(name: PostKey.postSettings)
    required Map<PostSetting, bool> postSettings,
    @ServerTimestampConverter()
    @JsonKey(name: PostKey.createdAt)
    required DateTime? createdAt,
    required String message,
    @JsonKey(name: PostKey.thumbnailUrl) required String thumbnailUrl,
    @JsonKey(name: PostKey.originalFileStorageId)
    required String originalFileStorageId,
    @JsonKey(name: PostKey.thumbnailStorageId)
    required String thumbnailStorageId,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json, {required String postId}) =>
      _$PostFromJson({
        ...json,
        PostKey.userId: postId,
      });

  String get postId => uid;

  bool get allowLikes => postSettings[PostSetting.allowLikes] ?? false;
}

class PostSettingsConverter
    implements JsonConverter<Map<PostSetting, bool>, Map<String, dynamic>> {
  const PostSettingsConverter();

  @override
  Map<PostSetting, bool> fromJson(Map<String, dynamic> json) =>
      json.map((key, value) => MapEntry(PostSetting.fromKey(key)!, value));

  @override
  Map<String, dynamic> toJson(Map<PostSetting, bool> postSettings) =>
      postSettings.map((key, value) => MapEntry(key.toKey(), value));
}

class ServerTimestampConverter implements JsonConverter<DateTime?, Object?> {
  const ServerTimestampConverter();

  @override
  DateTime? fromJson(Object? timestamp) {
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    } else {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }

  @override
  Object? toJson(Object? fieldValue) {
    if (fieldValue == null) return FieldValue.serverTimestamp();
    if (fieldValue is DateTime) return Timestamp.fromDate(fieldValue);
    return fieldValue;
  }
}
 */
