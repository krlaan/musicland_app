import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/state/user_info/models/user_info_payload.dart';
import 'package:musicland_app/typedef/user_id.dart';

class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveOrUpdateUserInfo({
    required UserId userId,
    String? displayName,
    String? email,
    String? fcmToken,
  }) async {
    try {
      var userInfo = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .where(FirebaseFieldName.userId, isEqualTo: userId)
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        Map<String, dynamic> updatedData = {};

        if (displayName != null) {
          updatedData[FirebaseFieldName.displayName] = displayName;
        }
        if (email != null) {
          updatedData[FirebaseFieldName.email] = email;
        }
        if (fcmToken != null) {
          updatedData[FirebaseFieldName.fcmToken] = fcmToken;
        }

        if (updatedData.isNotEmpty) {
          await userInfo.docs.first.reference.update(updatedData);
        }

        return true;
      }

      final payload = UserInfoPayload(
          userId: userId,
          displayName: displayName,
          email: email,
          fcmToken: fcmToken);

      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .add(payload);

      return true;
    } catch (_) {
      return false;
    }
  }
}

