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
    List<String>? instruments,
    List<String>? genres,
    String? experience,
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
        if (instruments != null) {
          updatedData[FirebaseFieldName.instruments] = instruments;
        }
        if (genres != null) {
          updatedData[FirebaseFieldName.genres] = genres;
        }
        if (experience != null) {
          updatedData[FirebaseFieldName.experience] = experience;
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
          fcmToken: fcmToken,
          instruments: instruments,
          genres: genres,
          experience: experience);

      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .add(payload);

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String?> getUserDisplayName(UserId userId) async {
    try {
      final userInfo = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .where(FirebaseFieldName.userId, isEqualTo: userId)
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        return userInfo.docs.first.data()[FirebaseFieldName.displayName] as String?;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<String?> getUserEmail(UserId userId) async {
    try {
      final userInfo = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .where(FirebaseFieldName.userId, isEqualTo: userId)
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        return userInfo.docs.first.data()[FirebaseFieldName.email] as String?;
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
