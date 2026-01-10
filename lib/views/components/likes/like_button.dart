import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/likes/modles/like_dislike_request.dart';
import 'package:musicland_app/state/likes/providers/has_liked_post_provider.dart';
import 'package:musicland_app/state/likes/providers/like_dislike_post_provider.dart';
import 'package:musicland_app/typedef/post_id.dart';

class LikeButton extends ConsumerWidget {
  final PostId postId;

  const LikeButton({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasLiked = ref.watch(hasLikedPostProvider(postId));
    return hasLiked.when(
      data: (hasLiked) {
        return IconButton(
          icon: FaIcon(
            hasLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
            color: hasLiked ? Colors.red : Colors.black,
          ),
          onPressed: () {
            final userId = ref.read(userIdProvider);
            if (userId == null) {
              return;
            }
            final likeRequest = LikeDislikeRequest(
              postId: postId,
              likedBy: userId,
            );
            ref.read(likeDislikePostProvider(request: likeRequest));
          },
        );
      },
      error: (error, stackTrace) {
        return Container();
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
