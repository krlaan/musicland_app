import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/typedef/post_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_likes_count_provider.g.dart';

@riverpod
Stream<int> postLikesCount(Ref ref, PostId postId) {
  return FirebaseFirestore.instance
      .collection(FirebaseCollectionName.likes)
      .where(FirebaseFieldName.postId, isEqualTo: postId)
      .snapshots()
      .map((snapshot) => snapshot.docs.length);
}
