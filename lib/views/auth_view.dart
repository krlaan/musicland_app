import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/auth/providers/is_logged_in_provider.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/is_loading/providers/is_loading_provider.dart';
import 'package:musicland_app/state/user_info/providers/user_info_provider.dart';
import 'package:musicland_app/views/authentication/login/login_view.dart';
import 'package:musicland_app/views/components/loading/loading_screen.dart';
import 'package:musicland_app/views/main/main_view.dart';

class AuthView extends ConsumerWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<bool>(isLoadingProvider, (_, isLoading) {
      if (isLoading) {
        LoadingScreen.instance().show(context: context);
      } else {
        LoadingScreen.instance().hide();
      }
    });

    final isLoggedIn = ref.watch(isLoggedInProvider);
    
    if (isLoggedIn) {
      final userId = ref.watch(userIdProvider);
      
      if (userId == null) {
        return const LoginView();
      }
      
      // Check if profile setup is needed
      final userInfoAsync = ref.watch(userInfoModelProvider(userId));
      
      return userInfoAsync.when(
        data: (userInfo) {
          // Check if profile needs setup
          if (userInfo.instruments.isEmpty || userInfo.genres.isEmpty) {
            // Redirect to profile setup
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go('/profile-setup');
            });
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return const MainView();
        },
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (_, __) {
          // If user info doesn't exist, go to profile setup
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/profile-setup');
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      );
    } else {
      return const LoginView();
    }
  }
}
