import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/likes/providers/post_likes_count_provider.dart';
import 'package:musicland_app/typedef/post_id.dart';
import 'package:musicland_app/views/components/animations/small_error_animation_view.dart';
import 'package:musicland_app/views/constants/strings.dart';

class LikesCountView extends ConsumerWidget {
  final PostId postId;

  const LikesCountView({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeCount = ref.watch(postLikesCountProvider(postId));
    return likeCount.when(data: (int likesCount) {
      final personOrPeople = likesCount == 1 ? Strings.person : Strings.people;
      final likesText = '$likesCount $personOrPeople ${Strings.likedThis}';
      return Text(likesText);
    }, error: (error, stackTrace) {
      return const SmallErrorAnimationView();
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
