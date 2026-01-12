import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/posts/providers/all_posts_provider.dart';
import 'package:musicland_app/state/posts/providers/create_post_provider.dart';
import 'package:musicland_app/views/profile_setup/constants.dart';
import 'package:musicland_app/views/constants/app_colors.dart';

class AddPostView extends ConsumerStatefulWidget {
  const AddPostView({super.key});

  @override
  ConsumerState<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends ConsumerState<AddPostView> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController experienceController;

  String? selectedInstrument;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    experienceController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    experienceController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        experienceController.text.isEmpty ||
        selectedInstrument == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields!')),
      );
      return false;
    }
    return true;
  }

  void _clearFields() {
    titleController.clear();
    descriptionController.clear();
    experienceController.clear();
    setState(() => selectedInstrument = null);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            // Title
            Text(
              'Title',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: titleController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Enter ad title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
            const SizedBox(height: 24),

            // Looking for
            Text(
              'Looking for',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedInstrument,
                isExpanded: true,
                underline: const SizedBox(),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                hint: const Text('Choose instrument', style: TextStyle(fontSize: 16)),
                style: const TextStyle(fontSize: 16, color: AppColors.black),
                items: ProfileSetupConstants.instruments.map((instrument) {
                  return DropdownMenuItem<String>(
                    value: instrument,
                    child: Text(instrument),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedInstrument = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),

            // Experience
            Text(
              'Years of Experience',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: experienceController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Enter years of experience',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
            const SizedBox(height: 24),

            // Description
            Text(
              'Description',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Enter ad description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
              minLines: 5,
              maxLines: 8,
            ),
            const SizedBox(height: 32),

            // Create button
            TextButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();

                if (!_validateFields()) return;

                final success = await ref.read(createPostProvider.notifier).createPost(
                  title: titleController.text,
                  instrument: selectedInstrument!,
                  message: descriptionController.text,
                  experience: experienceController.text,
                );

                if (success && context.mounted) {
                  ref.invalidate(allPostsProvider);

                  _clearFields();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Post created successfully!')),
                  );
                } else if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to create post')),
                  );
                }
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                backgroundColor: AppColors.green,
                foregroundColor: AppColors.white,
              ),
              child: const Text('CREATE', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      );
  }
}
