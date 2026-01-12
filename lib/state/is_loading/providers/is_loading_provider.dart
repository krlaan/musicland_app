import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/auth/providers/authentication_provider.dart';
import 'package:musicland_app/state/posts/providers/delete_post_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_loading_provider.g.dart';

@riverpod
bool isLoading(Ref ref) {
  final authProvider = ref.watch(authenticationProvider);
  final isDeletingPost = ref.watch(deletePostProvider);

  return authProvider.isLoading ||
      isDeletingPost;
}
