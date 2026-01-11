import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicland_app/state/posts/models/post_key.dart';

// This is fromJson to convert data from Firestore to Post class.
class Post {
  final String postId;
  final String userId;
  final String message;
  final DateTime createdAt;

  Post({
    required this.postId,
    required Map<String, dynamic> json,
  })  : userId = json[PostKey.userId],
        message = json[PostKey.message],
        createdAt = (json[PostKey.createdAt] as Timestamp).toDate();
}
