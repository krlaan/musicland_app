import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicland_app/state/posts/models/post_key.dart';
import 'package:musicland_app/typedef/user_id.dart';

// We use it for the PostPayload class. (toJson to upload data to Firestore)
class PostPayload extends MapView<String, dynamic> {
  PostPayload({
    required UserId userId,
    required String title,
    required String instrument,
    required String message,
  }) : super({
         PostKey.userId: userId,
         PostKey.title: title,
         PostKey.instrument: instrument,
         PostKey.message: message,
         PostKey.createdAt: FieldValue.serverTimestamp(),
       });
}
