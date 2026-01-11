import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:musicland_app/state/posts/models/post_key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_posts_provider.g.dart';

@riverpod
Stream<Iterable<Post>> userPosts(Ref ref) {
  final userId = ref.watch(userIdProvider);
  final controller = StreamController<Iterable<Post>>();

  if (userId == null) {
    controller.sink.add([]);
    return controller.stream;
  }

  // Load cache first (offline support)
  Future<void> emitCache() async {
    final prefs = await SharedPreferences.getInstance();
    final cached = prefs.getStringList('cached_user_posts_$userId');
    if (cached == null) return;
    final posts = cached
        .map((e) => Post.fromCacheMap(jsonDecode(e) as Map<String, dynamic>))
        .toList();
    if (posts.isNotEmpty) {
      controller.sink.add(posts);
    }
  }

  emitCache();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.posts)
      .orderBy(FirebaseFieldName.createdAt, descending: true)
      .where(PostKey.userId, isEqualTo: userId)
      .snapshots()
      .listen(
        (snapshot) {
      final posts = snapshot.docs
          .where((doc) => !doc.metadata.hasPendingWrites)
          .map((doc) => Post(postId: doc.id, json: doc.data()))
          .toList();

      controller.sink.add(posts);

      // Save to cache
      SharedPreferences.getInstance().then((prefs) {
        final jsonList = posts.map((p) => jsonEncode(p.toCacheMap())).toList();
        prefs.setStringList('cached_user_posts_$userId', jsonList);
      });
    },
    onError: (_) => emitCache(), // Fallback to cache on error
  );

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
}
