import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicland_app/state/posts/models/post_key.dart';

// This is fromJson to convert data from Firestore to Post class.
class Post {
  final String postId;
  final String userId;
  final String title;
  final String instrument;
  final String message;
  final String experience;
  final DateTime createdAt;

  Post({
    required this.postId,
    required Map<String, dynamic> json,
  })  : userId = json[PostKey.userId],
        title = json[PostKey.title] ?? '',
        instrument = json[PostKey.instrument] ?? '',
        message = json[PostKey.message],
        experience = json[PostKey.experience] ?? '',
        createdAt = (json[PostKey.createdAt] as Timestamp).toDate();

  // For offline cache
  Map<String, dynamic> toCacheMap() => {
        'postId': postId, // Store postId separately
        PostKey.userId: userId,
        PostKey.title: title,
        PostKey.instrument: instrument,
        PostKey.message: message,
        PostKey.experience: experience,
        'created_at_ms': createdAt.millisecondsSinceEpoch, // We can't store Timestamp directly in SharedPreferences
      };

  static Post fromCacheMap(Map<String, dynamic> map) {
    return Post(
      postId: map['postId'] as String,
      json: {
        PostKey.userId: map[PostKey.userId] ?? '',
        PostKey.title: map[PostKey.title] ?? '',
        PostKey.instrument: map[PostKey.instrument] ?? '',
        PostKey.message: map[PostKey.message] ?? '',
        PostKey.experience: map[PostKey.experience] ?? '',
        PostKey.createdAt: Timestamp.fromMillisecondsSinceEpoch( // Convert back to Timestamp
          (map['created_at_ms'] as int?) ?? 0,
        ),
      },
    );
  }
}
