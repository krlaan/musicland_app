import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/auth/providers/user_id_provider.dart';
import 'package:musicland_app/state/user_info/backend/user_info_storage.dart';
import 'package:musicland_app/state/user_info/providers/user_info_provider.dart';
import 'package:musicland_app/views/constants/app_colors.dart';
import 'package:musicland_app/views/profile_setup/constants.dart';

class ProfileSetupView extends ConsumerStatefulWidget {
  const ProfileSetupView({super.key});

  @override
  ConsumerState<ProfileSetupView> createState() => _ProfileSetupViewState();
}

class _ProfileSetupViewState extends ConsumerState<ProfileSetupView> {

  final selectedInstruments = <String>{};
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
        instruments: selectedInstruments.isNotEmpty
            ? selectedInstruments.toList()
            : null,
        genres: selectedGenres.isNotEmpty ? selectedGenres.toList() : null,
        experience: experienceController.text.isEmpty
            ? null
            : experienceController.text,
      );

      if (mounted) {
        ref.invalidate(userInfoModelProvider);
        context.go('/'); // Navigate to main app
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
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
      appBar: AppBar(title: const Text('Profile Setup')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Instruments Section
            const Text(
              'Instrument',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose one or many',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ProfileSetupConstants.instruments.map((instrument) {
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose one or many',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ProfileSetupConstants.genres.map((genre) {
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: experienceController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: 'Enter years (e.g. 1, 5, 10)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.lightGreen,
                  foregroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: _isLoading ? null : _saveSetup,
                child: const Text("SAVE", style: TextStyle(fontSize: 14)),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
