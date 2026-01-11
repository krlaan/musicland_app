import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/typedef/user_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'can_user_delete_post_provider.g.dart';

@riverpod
Stream<bool> canUserDeletePost(
    Ref ref,
    UserId postUserId,
    ) {
  final loggedInUserId = ref.watch(userIdProvider);
  return Stream.value(postUserId == loggedInUserId);
}