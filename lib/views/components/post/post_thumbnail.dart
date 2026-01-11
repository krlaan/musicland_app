import 'package:flutter/material.dart';
import 'package:musicland_app/state/posts/models/post.dart';

class PostThumbnailView extends StatelessWidget {
  final Post post;
  final VoidCallback onTapped;

  const PostThumbnailView({
    super.key,
    required this.post,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              post.message.length > 50
                  ? '${post.message.substring(0, 50)}...'
                  : post.message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
