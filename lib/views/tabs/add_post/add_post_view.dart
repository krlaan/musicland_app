import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/image_upload/helpers/image_picker_helper.dart';
import 'package:musicland_app/views/constants/strings.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            Strings.addPostView,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 50,
                onPressed: () async {
                  final File? file =
                      await ImagePickerHelper.pickImageFromGallery();
                  if (file != null && context.mounted) {
                    context.push('/create-new-post', extra: file);
                  }
                },
                icon: const Icon(Icons.image),
              ),
              IconButton(
                iconSize: 50,
                onPressed: () async {
                  final File? file =
                      await ImagePickerHelper.pickImageFromCamera();

                  // Ensure the widget is still in the widget tree (context is mounted)
                  if (file != null && context.mounted) {
                    context.push('/create-new-post', extra: file);
                  }
                },
                icon: const Icon(Icons.add_a_photo),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
