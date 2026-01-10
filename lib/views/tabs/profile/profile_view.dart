import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/posts/providers/user_posts_provider.dart';
import 'package:musicland_app/state/user_info/providers/user_info_provider.dart';
import 'package:musicland_app/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:musicland_app/views/components/animations/error_animation_view.dart';
import 'package:musicland_app/views/components/animations/loading_animation_view.dart';
import 'package:musicland_app/views/components/post/posts_grid_view.dart';
import 'package:musicland_app/views/constants/strings.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Header
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 40,
                backgroundImage: const NetworkImage(
                  'https://picsum.photos/200',
                ),
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(width: 16),
              // Posts, Followers, Following
              const Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '15', // Replace with dynamic post count
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Posts'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '120', // Replace with dynamic followers count
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Followers'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '75', // Replace with dynamic following count
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Following'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Consumer(builder: (context, ref, child) {
          var userId = ref.watch(userIdProvider);
          var userInfoModel = ref.watch(userInfoModelProvider(userId!));
          return userInfoModel.when(
              data: (userInfoModel) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    userInfoModel.displayName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              error: (_, error) {
                return const ErrorAnimationView();
              },
              loading: () => const CircularProgressIndicator());
        }),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: Container(
            child: posts.when(data: (posts) {
              if (posts.isEmpty) {
                return const SingleChildScrollView(
                  child: EmptyContentsWithTextAnimationView(
                      text: Strings.youHaveNoPosts),
                );
              }
              return PostsGridView(posts: posts);
            }, error: (error, stacktrace) {
              return const ErrorAnimationView();
            }, loading: () {
              return const LoadingAnimationView();
            }),
          ),
        ),
      ],
    );
  }
}
