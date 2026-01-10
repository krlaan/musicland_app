import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_by_search_term_provider.g.dart';

@riverpod
Stream<Iterable<Post>> postsBySearchTerm(
    Ref ref,
    String searchTerm,
    ) {
  final controller = StreamController<Iterable<Post>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.posts)
      .orderBy(
    FirebaseFieldName.createdAt,
    descending: true,
  )
      .snapshots()
      .listen(
        (snapshot) {
      final posts = snapshot.docs
          .map(
            (doc) => Post(
          json: doc.data(),
          postId: doc.id,
        ),
      )
          .where(
            (post) => post.message.toLowerCase().contains(
          searchTerm.toLowerCase(),
        ),
      );
      controller.add(posts);
    },
  );

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
}
