import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/user_info/providers/user_info_provider.dart';
import 'package:musicland_app/views/components/animations/error_animation_view.dart';
import 'package:musicland_app/views/components/animations/loading_animation_view.dart';
import 'package:musicland_app/views/constants/app_colors.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider) ?? "";

    final userInfoAsync = ref.watch(userInfoModelProvider(userId));

    return userInfoAsync.when(
      data: (userInfo) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile icon with username
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person, size: 40),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                        ),
                        Text(
                          userInfo.displayName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Instrument
              const Divider(height: 1),
              const SizedBox(height: 16),
              const Text(
                'Instrument',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                userInfo.instruments.isNotEmpty
                    ? userInfo.instruments.join(', ')
                    : 'not added yet',
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1),
              const SizedBox(height: 16),

              const Text(
                'Genres',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                userInfo.genres.isNotEmpty
                    ? userInfo.genres.join(', ')
                    : 'not added yet',
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1),
              const SizedBox(height: 16),

              const Text(
                'Experience',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                userInfo.experience != null && userInfo.experience!.isNotEmpty
                    ? '${userInfo.experience} years'
                    : 'not added yet',
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1),
              const SizedBox(height: 32),

              // Edit button
              TextButton(
                onPressed: () {
                  context.push('/profile-setup');
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.lightGrey,
                  foregroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('EDIT', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        );
      },
      loading: () => const LoadingAnimationView(),
      error: (_, _) => const ErrorAnimationView(),
    );
  }
}
