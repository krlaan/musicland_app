import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
  static const userId = 'uid';
  static const postId = 'post_id';
  static const comment = 'comment';
  static const date = 'date';
  static const displayName = 'display_name';
  static const email = 'email';
  static const createdAt = 'created_at';
  static const fcmToken = 'fcm_token';
  static const instruments = 'instruments';
  static const genres = 'genres';
  static const experience = 'experience';

  const FirebaseFieldName._();
}

