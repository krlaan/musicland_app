import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/state/constants/supabase_constants.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:musicland_app/typedef/is_loading.dart';
import 'package:musicland_app/typedef/post_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'delete_post_provider.g.dart';

@riverpod
class DeletePost extends _$DeletePost {
  @override
  IsLoading build() => false;

  Future<bool> deletePost({required Post post}) async {
    state = true;

    try {
      await _deletePostFiles(post: post);

      await _deleteAllDocuments(
        inCollection: FirebaseCollectionName.likes,
        postId: post.postId,
      );

      final postInCollection = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.posts)
          .doc(post.postId)
          .get();

      if (postInCollection.exists) {
        await postInCollection.reference.delete();
      }

      return true;
    } catch (_) {
      return false;
    } finally {
      state = false;
    }
  }

  /// Helper to delete all documents in a collection related to a post
  Future<void> _deleteAllDocuments({
    required PostId postId,
    required String inCollection,
  }) {
    return FirebaseFirestore.instance.runTransaction(
      maxAttempts: 3,
      timeout: const Duration(seconds: 20),
          (transaction) async {
        final query = await FirebaseFirestore.instance
            .collection(inCollection)
            .where(
          FirebaseFieldName.postId,
          isEqualTo: postId,
        )
            .get();
        for (final doc in query.docs) {
          transaction.delete(doc.reference);
        }
      },
    );
  }

  Future<void> _deletePostFiles({required Post post}) async {
    final fileName = post.fileName;
    final userId = post.userId;

    final paths = [
      '$userId/${SupabaseConstants.images}/$fileName.jpg',
      '$userId/${SupabaseConstants.thumbnails}/$fileName.jpg',
    ];

    await Supabase.instance.client.storage
        .from(SupabaseConstants.users)
        .remove(paths);
  }
}
