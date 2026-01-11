import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:musicland_app/views/components/post/post_thumbnail.dart';

class PostsGridView extends StatelessWidget {
  final Iterable<Post> posts;

  const PostsGridView({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts.elementAt(index);
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: PostThumbnailView(
            post: post,
            onTapped: () {
              context.push(
                '/post-details',
                extra: post,
              );
            },
          ),
        );
      },
    );
  }
}
