import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/state/user_info/models/user_info_model.dart';
import 'package:musicland_app/typedef/user_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_info_provider.g.dart';

@riverpod
Stream<UserInfoModel> userInfoModel(Ref ref, UserId id) {
  return FirebaseFirestore.instance
      .collection(FirebaseCollectionName.users)
      .where(FirebaseFieldName.userId, isEqualTo: id)
      .limit(1)
      .snapshots()
      .where((snapshot) => snapshot.docs.isNotEmpty)
      .map((snapshot) {
    final doc = snapshot.docs.first;
    return UserInfoModel.fromJson(doc.data());
  });
}
