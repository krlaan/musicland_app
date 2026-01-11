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
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  String? selectedInstrument;
  
  final instruments = ['Guitar', 'Bass', 'Drums', 'Piano', 'Vocals', 'Violin', 'Flute', 'Trumpet'];

  bool get isPostButtonEnabled =>
      titleController.text.isNotEmpty &&
      descriptionController.text.isNotEmpty &&
      selectedInstrument != null;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    titleController.addListener(_updateButtonState);
    descriptionController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.createAd),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Text(
              'Title',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: titleController,
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
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedInstrument,
                isExpanded: true,
                underline: const SizedBox(),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                hint: const Text('Choose instrument'),
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

            // Description
            Text(
              'Description',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
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
                  ? () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (context.mounted) {
                        context.pop();
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.green,
                disabledBackgroundColor: Colors.grey[300],
              ),
              child: const Text(
                'POST',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
