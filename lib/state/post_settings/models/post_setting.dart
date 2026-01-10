import 'package:musicland_app/state/post_settings/constants/constants.dart';

enum PostSetting {
  allowLikes(
    title: Constants.allowLikesTitle,
    description: Constants.allowLikesDescription,
    storageKey: Constants.allowLikesStorageKey,
  );

  final String title;
  final String description;

  // firebase storage key
  final String storageKey;

  const PostSetting({
    required this.title,
    required this.description,
    required this.storageKey,
  });

  /*
   For people who are using freezed package for Post, here is the code for the PostSetting model:
  // Conversion from JSON key to PostSetting
  static PostSetting? fromKey(String key) {
    switch (key) {
      case Constants.allowLikesStorageKey:
        return PostSetting.allowLikes;
      default:
        return null;
    }
  }

  // Conversion from PostSetting to JSON key
  String toKey() {
    return storageKey;
  }*/
}
