import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        iconSize: 60,
        icon: const Icon(Icons.add),
        onPressed: () {
          context.push('/create-new-post');
        },
      ),
    );
  }
}
