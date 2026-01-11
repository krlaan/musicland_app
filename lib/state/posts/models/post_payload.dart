import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicland_app/state/post_settings/models/post_setting.dart';
import 'package:musicland_app/state/posts/models/post_key.dart';
import 'package:musicland_app/typedef/user_id.dart';

// We use it for the PostPayload class. (toJson to upload data to Firestore)
class PostPayload extends MapView<String, dynamic> {
  PostPayload({
    required UserId userId,
    required String message,
    required Map<PostSetting, bool> postSettings,
  }) : super({
         PostKey.userId: userId,
         PostKey.message: message,
         PostKey.createdAt: FieldValue.serverTimestamp(),
         PostKey.postSettings: {
           for (final postSetting in postSettings.entries)
             postSetting.key.storageKey: postSetting.value,
         },
       });
}
