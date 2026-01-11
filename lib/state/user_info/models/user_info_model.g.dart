// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoModelImpl _$$UserInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoModelImpl(
      userId: json['uid'] as String,
      displayName: json['display_name'] as String,
      email: json['email'] as String?,
      instruments:
          (json['instruments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      experience: json['experience'] as String?,
    );

Map<String, dynamic> _$$UserInfoModelImplToJson(_$UserInfoModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.userId,
      'display_name': instance.displayName,
      'email': instance.email,
      'instruments': instance.instruments,
      'genres': instance.genres,
      'experience': instance.experience,
    };
