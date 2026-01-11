import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/posts/providers/all_posts_provider.dart';
import 'package:musicland_app/state/posts/providers/create_post_provider.dart';

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

  final instruments = [
    'Guitar',
    'Bass',
    'Drums',
    'Keyboard',
    'Vocals',
    'Violin',
    'Saxophone',
    'Trumpet',
  ];

  bool get isPostButtonEnabled =>
      titleController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty &&
          experienceController.text.isNotEmpty &&
          selectedInstrument != null;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    experienceController = TextEditingController();
    titleController.addListener(_updateButtonState);
    descriptionController.addListener(_updateButtonState);
    experienceController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    experienceController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
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
                border: Border.all(color: Colors.grey[700]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedInstrument,
                isExpanded: true,
                underline: const SizedBox(),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                hint: const Text('Choose instrument', style: TextStyle(fontSize: 16)),
                style: const TextStyle(fontSize: 16, color: Colors.black),
                items: instruments.map((instrument) {
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

            // Post button
            ElevatedButton(
              onPressed: isPostButtonEnabled
                  ? () async {
                FocusManager.instance.primaryFocus?.unfocus();

                final success = await ref.read(createPostProvider.notifier).createPost(
                  title: titleController.text,
                  instrument: selectedInstrument!,
                  message: descriptionController.text,
                  experience: experienceController.text,
                );

                if (success && context.mounted) {
                  ref.invalidate(allPostsProvider);

                  // Clear all fields
                  titleController.clear();
                  descriptionController.clear();
                  experienceController.clear();
                  setState(() {
                    selectedInstrument = null;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Post created successfully!')),
                  );
                } else if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to create post')),
                  );
                }
              }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: isPostButtonEnabled ? Colors.green : null,
                foregroundColor: isPostButtonEnabled ? Colors.white : null,
              ),
              child: const Text('CREATE', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      );
  }
}
