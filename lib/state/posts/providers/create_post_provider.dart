import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/constants/firebase_collection_name.dart';
import 'package:musicland_app/state/posts/models/post_payload.dart';
import 'package:musicland_app/typedef/is_loading.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_post_provider.g.dart';

@riverpod
class CreatePost extends _$CreatePost {
  @override
  IsLoading build() => false;

  Future<bool> createPost({
    required String title,
    required String instrument,
    required String message,
    required String experience,
  }) async {
    state = true;
    try {
      final userId = ref.read(userIdProvider);
      if (userId == null) {
        return false;
      }

      final postPayload = PostPayload(
        userId: userId,
        title: title,
        instrument: instrument,
        message: message,
        experience: experience,
      );

      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.posts)
          .add(postPayload);

      return true;
    } catch (e) {
      return false;
    } finally {
      state = false;
    }
  }
}
