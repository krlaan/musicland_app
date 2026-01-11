import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/posts/models/post.dart';
import 'package:musicland_app/views/auth_view.dart';
import 'package:musicland_app/views/authentication/register/register_view.dart';
import 'package:musicland_app/views/create_new_post/create_new_post_view.dart';
import 'package:musicland_app/views/post_details/post_details_view.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthView();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterView();
      },
    ),
    GoRoute(
      path: '/create-new-post',
      builder: (BuildContext context, GoRouterState state) {
        return const CreateNewPostView();
      },
    ),
    GoRoute(
      path: '/post-details',
      builder: (BuildContext context, GoRouterState state) {
        // Retrieve the Post object from extra
        final post = state.extra as Post;
        return PostDetailsView(post: post);
      },
    ),
  ],
);
