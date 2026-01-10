import 'dart:collection';

import 'package:musicland_app/state/post_settings/models/post_setting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_setting_provider.g.dart';

@riverpod
class PostSettings extends _$PostSettings {
  @override
  Map<PostSetting, bool> build() {
    // Build the initial state as an unmodifiable map where all PostSetting values are set to true.
    // This ensures each post setting is enabled by default.
    return UnmodifiableMapView(
      {
        for (final setting in PostSetting.values) setting: true,
      },
    );
  }

  void setSetting(
      PostSetting setting,
      bool value,
      ) {
    // Retrieve the current value for the specified setting.
    final bool? existingValue = state[setting];

    // If the setting does not exist or the value has not changed, do nothing.
    if (existingValue == null || existingValue == value) {
      return;
    }

    // Update the state by creating a new immutable map with the updated setting.
    // This approach ensures the state remains immutable while reflecting the change.
    state = Map.unmodifiable(Map.from(state)..[setting] = value);
  }
}
