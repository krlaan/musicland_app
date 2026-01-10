import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:musicland_app/state/user_info/providers/user_info_provider.dart';
import 'package:musicland_app/views/components/animations/small_error_animation_view.dart';
import 'package:musicland_app/views/components/texts/rich_two_part_texts.dart';

class PostDisplayNameAndMessageView extends ConsumerWidget {
  final Post post;

  const PostDisplayNameAndMessageView({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoModel = ref.watch(
      userInfoModelProvider(post.userId),
    );

    return userInfoModel.when(
      data: (userInfoModel) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichTwoPartTexts(
            leftPart: userInfoModel.displayName,
            rightPart: post.message,
          ),
        );
      },
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
