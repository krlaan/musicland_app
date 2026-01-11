import 'package:flutter/foundation.dart' show immutable;

@immutable
class PostKey {
  static const userId = 'uid';
  static const message = 'message';
  static const createdAt = 'created_at';

  const PostKey._();
}
