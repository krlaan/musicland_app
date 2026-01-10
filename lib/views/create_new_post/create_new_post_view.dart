import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/image_upload/providers/image_upload_provider.dart';
import 'package:musicland_app/state/post_settings/models/post_setting.dart';
import 'package:musicland_app/state/post_settings/providers/post_setting_provider.dart';
import 'package:musicland_app/typedef/user_id.dart';
import 'package:musicland_app/views/constants/strings.dart';

class CreateNewPostView extends ConsumerStatefulWidget {
  final File fileToPost;

  const CreateNewPostView({super.key, required this.fileToPost});

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
    final postSettings = ref.watch(postSettingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.createNewPost),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: isPostButtonEnabled
                ? () async {
              // Hide the keyboard
              FocusManager.instance.primaryFocus?.unfocus();

              final UserId? userId = ref.read(userIdProvider);
              if (userId == null) {
                return;
              }

              final message = postController.text;

              final bool isUploaded = await ref
                  .read(imageUploadProvider.notifier)
                  .upload(
                  file: widget.fileToPost,
                  message: message,
                  postSettings: postSettings,
                  userId: userId);

              if (isUploaded && context.mounted) {
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
              Image.file(widget.fileToPost),
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
              // Generating a list of ListTiles for each PostSetting with a title, description, and toggle switch.
              ...PostSetting.values.map((PostSetting postSetting) => ListTile(
                title: Text(postSetting.title),
                subtitle: Text(postSetting.description),
                leading: Switch(
                  value: postSettings[postSetting] ?? false,
                  onChanged: (value) {
                    ref
                        .read(postSettingsProvider.notifier)
                        .setSetting(postSetting, value);
                  },
                ),
              )),
            ],
          )),
    );
  }
}
