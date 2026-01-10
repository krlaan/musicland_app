import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:musicland_app/state/posts/models/post_key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_posts_provider.g.dart';

@riverpod
Stream<Iterable<Post>> userPosts(Ref ref) {
  final userId = ref.watch(userIdProvider);

  return FirebaseFirestore.instance
      .collection(FirebaseCollectionName.posts)
      .orderBy(FirebaseFieldName.createdAt, descending: true)
      .where(PostKey.userId, isEqualTo: userId)
      .snapshots()
      .map((snapshot) => snapshot.docs
      .where((doc) => !doc.metadata.hasPendingWrites)
      .map((doc) => Post(postId: doc.id, json: doc.data())));
}
