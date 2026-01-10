import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/auth/providers/authentication_provider.dart';
import 'package:musicland_app/state/image_upload/providers/image_upload_provider.dart';
import 'package:musicland_app/state/posts/providers/delete_post_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_loading_provider.g.dart';

// TODO(all): Will add more providers here later
@riverpod
bool isLoading(Ref ref) {
  final authProvider = ref.watch(authenticationProvider);
  final isImageUploading = ref.watch(imageUploadProvider);
  final isDeletingPost = ref.watch(deletePostProvider);

  return authProvider.isLoading ||
      isImageUploading ||
      isDeletingPost;
}
