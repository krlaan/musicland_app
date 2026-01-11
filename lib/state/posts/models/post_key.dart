import 'package:flutter/foundation.dart' show immutable;

@immutable
class PostKey {
  static const userId = 'uid';
  static const message = 'message';
  static const createdAt = 'created_at';
  static const postSettings = 'post_settings';

  const PostKey._();
}
