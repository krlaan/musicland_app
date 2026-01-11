import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:musicland_app/state/user_info/providers/user_info_provider.dart';
import 'package:musicland_app/views/components/likes/like_button.dart';

class PostThumbnailView extends ConsumerWidget {
  final Post post;
  final VoidCallback onTapped;

  const PostThumbnailView({
    super.key,
    required this.post,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoModel = ref.watch(
      userInfoModelProvider(post.userId),
    );

    return GestureDetector(
      onTap: onTapped,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: Title and Like button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      post.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  LikeButton(postId: post.postId),
                ],
              ),
              const SizedBox(height: 6),
              // Description
              Text(
                post.message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              // Divider
              Divider(
                color: Colors.grey[400],
                thickness: 1.5,
                height: 1,
              ),
              const SizedBox(height: 4),
              // Genre and Experience from user profile
              userInfoModel.when(
                data: (userInfo) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      if (userInfo.genres.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.music_note,
                                  size: 18, color: Colors.blue[700]),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  userInfo.genres.join(', '),
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
                      if (post.experience.isNotEmpty)
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 18, color: Colors.amber[700]),
                            const SizedBox(width: 6),
                            Text(
                              '${post.experience} years',
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
                error: (_, _) => const SizedBox.shrink(),
                loading: () => const SizedBox(
                  height: 16,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
