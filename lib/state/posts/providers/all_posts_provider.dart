import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'all_posts_provider.g.dart';

@riverpod
Stream<Iterable<Post>> allPosts(Ref ref) {
  final controller = StreamController<Iterable<Post>>();

  // Load cache first (offline support)
  Future<void> emitCache() async {
    final prefs = await SharedPreferences.getInstance();
    final cached = prefs.getStringList('cached_posts');
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
      .collection(
    FirebaseCollectionName.posts,
  )
      .orderBy(
    FirebaseFieldName.createdAt,
    descending: true,
  )
      .snapshots()
      .listen(
        (snapshots) {
      final posts = snapshots.docs
          .map(
            (doc) => Post(
              json: doc.data(),
              postId: doc.id,
            ),
          )
          .toList();
      controller.sink.add(posts);

      // Save to cache
      SharedPreferences.getInstance().then((prefs) {
        final jsonList = posts.map((p) => jsonEncode(p.toCacheMap())).toList();
        prefs.setStringList('cached_posts', jsonList);
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
