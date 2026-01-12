import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/typedef/user_id.dart';

@immutable
class UserInfoPayload extends MapView<String, dynamic> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
    List<String>? instruments,
    List<String>? genres,
    String? experience,
  }) : super(
    {
      FirebaseFieldName.userId: userId,
      FirebaseFieldName.displayName: displayName ?? '',
      FirebaseFieldName.email: email ?? '',
      FirebaseFieldName.instruments: instruments ?? '',
      FirebaseFieldName.genres: genres ?? '',
      FirebaseFieldName.experience: experience ?? ''
    },
  );
}

