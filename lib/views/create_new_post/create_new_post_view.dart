import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/views/constants/strings.dart';

class CreateNewPostView extends ConsumerStatefulWidget {
  const CreateNewPostView({super.key});

  @override
  ConsumerState<CreateNewPostView> createState() => _CreateNewPostViewState();
}

class _CreateNewPostViewState extends ConsumerState<CreateNewPostView> {
  late final TextEditingController postController;
  bool isPostButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    postController = TextEditingController();
    postController.addListener(_updatePostButtonState);
  }

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  void _updatePostButtonState() {
    setState(() {
      isPostButtonEnabled = postController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.createAd),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: isPostButtonEnabled
                ? () async {
                  // Hide the keyboard
                  FocusManager.instance.primaryFocus?.unfocus();
                  // For now, just close the page after entering text
                  if (context.mounted) {
                    context.pop();
                  }
            }
                : null,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: postController,
                  decoration: const InputDecoration(
                    labelText: Strings.pleaseWriteYourMessageHere,
                  ),
                  autofocus: true,
                ),
              ),
            ],
          )),
    );
  }
}
