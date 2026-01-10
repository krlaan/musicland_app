// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LikeImpl _$$LikeImplFromJson(Map<String, dynamic> json) => _$LikeImpl(
  postId: json['post_id'] as String,
  likedBy: json['uid'] as String,
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$$LikeImplToJson(_$LikeImpl instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'uid': instance.likedBy,
      'date': instance.date.toIso8601String(),
    };
