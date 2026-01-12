import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/user_info/backend/user_info_storage.dart';
import 'package:musicland_app/state/user_info/providers/user_info_provider.dart';

class ProfileSetupView extends ConsumerStatefulWidget {
  const ProfileSetupView({super.key});

  @override
  ConsumerState<ProfileSetupView> createState() => _ProfileSetupViewState();
}

class _ProfileSetupViewState extends ConsumerState<ProfileSetupView> {
  // Instruments
  static const instruments = [
    'Guitar',
    'Bass',
    'Drums',
    'Keyboard',
    'Vocals',
    'Violin',
    'Saxophone',
    'Trumpet',
  ];
  final selectedInstruments = <String>{};

  // Genres
  static const genres = [
    'Metal',
    'Rock',
    'Pop',
    'Jazz',
    'Blues',
    'Classical',
    'Electronic',
    'Hip-Hop',
  ];
  final selectedGenres = <String>{};

  // Experience
  final experienceController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    experienceController.dispose();
    super.dispose();
  }

  Future<void> _saveSetup() async {
    final userId = ref.read(userIdProvider);
    if (userId == null) return;

    setState(() => _isLoading = true);

    try {
      await const UserInfoStorage().saveOrUpdateUserInfo(
        userId: userId,
        instruments: selectedInstruments.isNotEmpty ? selectedInstruments.toList() : null,
        genres: selectedGenres.isNotEmpty ? selectedGenres.toList() : null,
        experience: experienceController.text.isEmpty ? null : experienceController.text,
      );

      if (mounted) {
        ref.invalidate(userInfoModelProvider);
        context.go('/'); // Navigate to main app
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Setup'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Instruments Section
            const Text(
              'Instrument',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose one or many',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: instruments.map((instrument) {
                final isSelected = selectedInstruments.contains(instrument);
                return FilterChip(
                  label: Text(instrument),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedInstruments.add(instrument);
                      } else {
                        selectedInstruments.remove(instrument);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 32),

            // Genres Section
            const Text(
              'Genre',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose one or many',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: genres.map((genre) {
                final isSelected = selectedGenres.contains(genre);
                return FilterChip(
                  label: Text(genre),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedGenres.add(genre);
                      } else {
                        selectedGenres.remove(genre);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 32),

            // Experience Section
            const Text(
              'Experience',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: experienceController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                hintText: 'Enter years (e.g. 1, 5, 10)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveSetup,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('SAVE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
