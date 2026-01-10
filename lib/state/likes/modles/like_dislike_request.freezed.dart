// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_dislike_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LikeDislikeRequest {
  String get postId => throw _privateConstructorUsedError;
  String get likedBy => throw _privateConstructorUsedError;

  /// Create a copy of LikeDislikeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikeDislikeRequestCopyWith<LikeDislikeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeDislikeRequestCopyWith<$Res> {
  factory $LikeDislikeRequestCopyWith(
      LikeDislikeRequest value, $Res Function(LikeDislikeRequest) then) =
  _$LikeDislikeRequestCopyWithImpl<$Res, LikeDislikeRequest>;
  @useResult
  $Res call({String postId, String likedBy});
}

/// @nodoc
class _$LikeDislikeRequestCopyWithImpl<$Res, $Val extends LikeDislikeRequest>
    implements $LikeDislikeRequestCopyWith<$Res> {
  _$LikeDislikeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LikeDislikeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? likedBy = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
      as String,
      likedBy: null == likedBy
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
      as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikeDislikeRequestImplCopyWith<$Res>
    implements $LikeDislikeRequestCopyWith<$Res> {
  factory _$$LikeDislikeRequestImplCopyWith(_$LikeDislikeRequestImpl value,
      $Res Function(_$LikeDislikeRequestImpl) then) =
  __$$LikeDislikeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postId, String likedBy});
}

/// @nodoc
class __$$LikeDislikeRequestImplCopyWithImpl<$Res>
    extends _$LikeDislikeRequestCopyWithImpl<$Res, _$LikeDislikeRequestImpl>
    implements _$$LikeDislikeRequestImplCopyWith<$Res> {
  __$$LikeDislikeRequestImplCopyWithImpl(_$LikeDislikeRequestImpl _value,
      $Res Function(_$LikeDislikeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of LikeDislikeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? likedBy = null,
  }) {
    return _then(_$LikeDislikeRequestImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
      as String,
      likedBy: null == likedBy
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }
}

/// @nodoc

class _$LikeDislikeRequestImpl implements _LikeDislikeRequest {
  const _$LikeDislikeRequestImpl({required this.postId, required this.likedBy});

  @override
  final String postId;
  @override
  final String likedBy;

  @override
  String toString() {
    return 'LikeDislikeRequest(postId: $postId, likedBy: $likedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeDislikeRequestImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.likedBy, likedBy) || other.likedBy == likedBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId, likedBy);

  /// Create a copy of LikeDislikeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeDislikeRequestImplCopyWith<_$LikeDislikeRequestImpl> get copyWith =>
      __$$LikeDislikeRequestImplCopyWithImpl<_$LikeDislikeRequestImpl>(
          this, _$identity);
}

abstract class _LikeDislikeRequest implements LikeDislikeRequest {
  const factory _LikeDislikeRequest(
      {required final String postId,
        required final String likedBy}) = _$LikeDislikeRequestImpl;

  @override
  String get postId;
  @override
  String get likedBy;

  /// Create a copy of LikeDislikeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeDislikeRequestImplCopyWith<_$LikeDislikeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
