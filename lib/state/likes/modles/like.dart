import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/typedef/post_id.dart';
import 'package:musicland_app/typedef/user_id.dart';

part 'like.freezed.dart';

part 'like.g.dart';

@freezed
class Like with _$Like {
  const factory Like({
    @JsonKey(name: FirebaseFieldName.postId) required PostId postId,
    @JsonKey(name: FirebaseFieldName.userId) required UserId likedBy,
    @JsonKey(name: FirebaseFieldName.date) required DateTime date,
  }) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
}
