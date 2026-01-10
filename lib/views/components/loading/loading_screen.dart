import 'package:flutter/material.dart';
import 'package:musicland_app/views/constants/strings.dart';

class LoadingScreen {
  LoadingScreen._();

  static final LoadingScreen _sharedInstance = LoadingScreen._();

  factory LoadingScreen.instance() => _sharedInstance;

  OverlayEntry? _currentOverlay;

  void show({
    required BuildContext context,
    String text = Strings.loading,
  }) {
    if (_currentOverlay != null) return;

    final overlayState = Overlay.of(context);

    _currentOverlay = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );
    });

    overlayState.insert(_currentOverlay!);
  }

  void hide() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}
