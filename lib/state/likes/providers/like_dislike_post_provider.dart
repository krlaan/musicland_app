import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/state/likes/modles/like.dart';
import 'package:musicland_app/state/likes/modles/like_dislike_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_dislike_post_provider.g.dart';

@riverpod
class LikeDislikePost extends _$LikeDislikePost {
  @override
  Future<bool> build({
    required LikeDislikeRequest request,
  }) async {
    final query = FirebaseFirestore.instance
        .collection(FirebaseCollectionName.likes)
        .where(
      FirebaseFieldName.postId,
      isEqualTo: request.postId,
    )
        .where(
      FirebaseFieldName.userId,
      isEqualTo: request.likedBy,
    )
        .get();

    // Check if the user has already liked the post
    final hasLiked = await query.then(
          (snapshot) => snapshot.docs.isNotEmpty,
    );

    if (hasLiked) {
      // Delete the like
      return await _removeLike(query);
    } else {
      // Add a new like
      return await _addLike(request);
    }
  }

  Future<bool> _removeLike(Future<QuerySnapshot> query) async {
    try {
      await query.then((snapshot) async {
        for (final doc in snapshot.docs) {
          await doc.reference.delete();
        }
      });
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> _addLike(LikeDislikeRequest request) async {
    final like = Like(
      postId: request.postId,
      likedBy: request.likedBy,
      date: DateTime.now(),
    );

    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.likes)
          .add(like.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }
}
