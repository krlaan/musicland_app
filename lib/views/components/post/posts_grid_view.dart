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
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts.elementAt(index);
        return PostThumbnailView(
          post: post,
          onTapped: () {
            context.push(
              '/post-details',
              extra: post,
            );
          },
        );
      },
    );
  }
}
