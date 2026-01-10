import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:musicland_app/state/posts/providers/can_user_delete_post_provider.dart';
import 'package:musicland_app/state/posts/providers/delete_post_provider.dart';
import 'package:musicland_app/views/components/likes/like_button.dart';
import 'package:musicland_app/views/components/likes/likes_count_view.dart';
import 'package:musicland_app/views/components/post/post_date_view.dart';
import 'package:musicland_app/views/components/post/post_image_view.dart';
import 'package:musicland_app/views/components/post/post_name_and_message_view.dart';
import 'package:musicland_app/views/constants/strings.dart';
import 'package:musicland_app/views/dialogs/alert_dialog_model.dart';
import 'package:musicland_app/views/dialogs/delete_dialog.dart';

class PostDetailsView extends ConsumerWidget {
  final Post post;

  const PostDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canDeletePost = ref.watch(canUserDeletePostProvider(post.userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.postDetails),
        actions: [
          if (canDeletePost.value ?? false)
            IconButton(
              onPressed: () async {
                final shouldDeletePost = await const DeleteDialog(
                  titleOfObjectToDelete: Strings.posts,
                ).present(context);

                if (shouldDeletePost ?? false) {
                  var isPostDeleted = await ref
                      .read(deletePostProvider.notifier)
                      .deletePost(post: post);
                  if (isPostDeleted && context.mounted) {
                    context.pop();
                  }
                }
              },
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PostImageView(post: post),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (post.allowsLikes) LikeButton(postId: post.postId),
              ],
            ),
            PostDisplayNameAndMessageView(post: post),
            PostDateView(dateTime: post.createdAt),
            const Divider(color: Colors.black),
            if (post.allowsLikes)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LikesCountView(postId: post.postId),
              ),
          ],
        ),
      ),
    );
  }
}
