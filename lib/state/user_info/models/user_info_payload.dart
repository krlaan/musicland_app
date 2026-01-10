import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/typedef/user_id.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
    required String? fcmToken,
  }) : super(
    {
      FirebaseFieldName.userId: userId,
      FirebaseFieldName.displayName: displayName ?? '',
      FirebaseFieldName.email: email ?? '',
      FirebaseFieldName.fcmToken: fcmToken ?? '',
    },
  );
}

