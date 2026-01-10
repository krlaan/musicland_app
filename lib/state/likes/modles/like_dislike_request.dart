import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicland_app/typedef/post_id.dart';
import 'package:musicland_app/typedef/user_id.dart';

part 'like_dislike_request.freezed.dart';

@freezed
class LikeDislikeRequest with _$LikeDislikeRequest {
  const factory LikeDislikeRequest({
    required PostId postId,
    required UserId likedBy,
  }) = _LikeDislikeRequest;
}
