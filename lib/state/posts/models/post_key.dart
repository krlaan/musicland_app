import 'package:flutter/foundation.dart' show immutable;

@immutable
class PostKey {
  static const userId = 'uid';
  static const title = 'title';
  static const instrument = 'instrument';
  static const message = 'message';
  static const experience = 'experience';
  static const createdAt = 'created_at';

  const PostKey._();
}
