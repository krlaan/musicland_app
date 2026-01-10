import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/typedef/post_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'has_liked_post_provider.g.dart';

@riverpod
Stream<bool> hasLikedPost(Ref ref, PostId postId) {
  final userId = ref.watch(userIdProvider);

  if (userId == null) {
    return Stream.value(false);
  }

  return FirebaseFirestore.instance
      .collection(FirebaseCollectionName.likes)
      .where(FirebaseFieldName.postId, isEqualTo: postId)
      .where(FirebaseFieldName.userId, isEqualTo: userId)
      .snapshots()
      .map((snapshot) => snapshot.docs.isNotEmpty);
}
