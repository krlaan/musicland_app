import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicland_app/state/constants/firebase_field_name.dart';
import 'package:musicland_app/typedef/user_id.dart';

part 'user_info_model.freezed.dart';

part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    @JsonKey(name: FirebaseFieldName.userId) required UserId userId,
    @JsonKey(name: FirebaseFieldName.displayName) required String displayName,
    @JsonKey(name: FirebaseFieldName.email) String? email,
    @JsonKey(name: FirebaseFieldName.instruments) @Default([]) List<String> instruments,
    @JsonKey(name: FirebaseFieldName.genres) @Default([]) List<String> genres,
    @JsonKey(name: FirebaseFieldName.experience) String? experience,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
