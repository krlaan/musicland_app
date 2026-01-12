import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:musicland_app/state/posts/providers/can_user_delete_post_provider.dart';
import 'package:musicland_app/state/posts/providers/delete_post_provider.dart';
import 'package:musicland_app/state/user_info/providers/user_info_provider.dart';
import 'package:musicland_app/views/components/likes/like_button.dart';
import 'package:musicland_app/views/components/likes/likes_count_view.dart';
import 'package:musicland_app/views/constants/strings.dart';
import 'package:musicland_app/views/dialogs/alert_dialog_model.dart';
import 'package:musicland_app/views/dialogs/delete_dialog.dart';

class PostDetailsView extends ConsumerWidget {
  final Post post;

  const PostDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canDeletePost = ref.watch(canUserDeletePostProvider(post.userId));
    final userInfo = ref.watch(userInfoModelProvider(post.userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.adDetails),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with like button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          post.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          LikeButton(postId: post.postId),
                          LikesCountView(postId: post.postId),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Divider line
                  const Divider(
                    color: Colors.black,
                    thickness: 1.5,
                    height: 1,
                  ),
                  const SizedBox(height: 12),
                  // Looking for
                  Text(
                    'Looking for: ${post.instrument}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Genre and Experience
                  userInfo.when(
                    data: (userData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (userData.genres.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.music_note,
                                      size: 18, color: Colors.blue[700]),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      userData.genres.join(', '),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue[700],
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (userData.experience != null && userData.experience!.isNotEmpty)
                            Row(
                              children: [
                                Icon(Icons.star,
                                    size: 18, color: Colors.amber[700]),
                                const SizedBox(width: 6),
                                Text(
                                  '${userData.experience} years',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.amber[700],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      );
                    },
                    loading: () => const SizedBox(
                      height: 16,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    error: (_, _) => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 16),
                  // Description box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[700]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      post.message,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: userInfo.when(
                data: (userData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username
                      Center(
                        child: Text(
                          '@${userData.displayName}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Instrument
                      const Center(
                        child: Text(
                          'Instrument',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Center(
                        child: Text(
                          userData.instruments.isNotEmpty
                              ? userData.instruments.join(', ')
                              : '-',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Genres and Experience
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Genres',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  userData.genres.isNotEmpty
                                      ? userData.genres.join(', ')
                                      : '-',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Experience',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  post.experience.isNotEmpty
                                      ? '${post.experience} years'
                                      : '-',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Divider line
                      Divider(
                        color: Colors.grey[400],
                        thickness: 1.5,
                        height: 1,
                      ),
                      const SizedBox(height: 16),
                      // Contact me section
                      const Center(
                        child: Text(
                          'Contact me:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          userData.email ?? 'No email provided',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stackTrace) => Text('Error: $error'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
