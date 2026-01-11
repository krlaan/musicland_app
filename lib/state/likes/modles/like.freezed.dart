// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Like _$LikeFromJson(Map<String, dynamic> json) {
  return _Like.fromJson(json);
}

/// @nodoc
mixin _$Like {
  @JsonKey(name: FirebaseFieldName.postId)
  String get postId => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseFieldName.userId)
  String get likedBy => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseFieldName.date)
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this Like to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikeCopyWith<Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCopyWith<$Res> {
  factory $LikeCopyWith(Like value, $Res Function(Like) then) =
      _$LikeCopyWithImpl<$Res, Like>;
  @useResult
  $Res call({
    @JsonKey(name: FirebaseFieldName.postId) String postId,
    @JsonKey(name: FirebaseFieldName.userId) String likedBy,
    @JsonKey(name: FirebaseFieldName.date) DateTime date,
  });
}

/// @nodoc
class _$LikeCopyWithImpl<$Res, $Val extends Like>
    implements $LikeCopyWith<$Res> {
  _$LikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? likedBy = null,
    Object? date = null,
  }) {
    return _then(
      _value.copyWith(
            postId: null == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                      as String,
            likedBy: null == likedBy
                ? _value.likedBy
                : likedBy // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LikeImplCopyWith<$Res> implements $LikeCopyWith<$Res> {
  factory _$$LikeImplCopyWith(
    _$LikeImpl value,
    $Res Function(_$LikeImpl) then,
  ) = __$$LikeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: FirebaseFieldName.postId) String postId,
    @JsonKey(name: FirebaseFieldName.userId) String likedBy,
    @JsonKey(name: FirebaseFieldName.date) DateTime date,
  });
}

/// @nodoc
class __$$LikeImplCopyWithImpl<$Res>
    extends _$LikeCopyWithImpl<$Res, _$LikeImpl>
    implements _$$LikeImplCopyWith<$Res> {
  __$$LikeImplCopyWithImpl(_$LikeImpl _value, $Res Function(_$LikeImpl) _then)
    : super(_value, _then);

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? likedBy = null,
    Object? date = null,
  }) {
    return _then(
      _$LikeImpl(
        postId: null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as String,
        likedBy: null == likedBy
            ? _value.likedBy
            : likedBy // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LikeImpl implements _Like {
  const _$LikeImpl({
    @JsonKey(name: FirebaseFieldName.postId) required this.postId,
    @JsonKey(name: FirebaseFieldName.userId) required this.likedBy,
    @JsonKey(name: FirebaseFieldName.date) required this.date,
  });

  factory _$LikeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikeImplFromJson(json);

  @override
  @JsonKey(name: FirebaseFieldName.postId)
  final String postId;
  @override
  @JsonKey(name: FirebaseFieldName.userId)
  final String likedBy;
  @override
  @JsonKey(name: FirebaseFieldName.date)
  final DateTime date;

  @override
  String toString() {
    return 'Like(postId: $postId, likedBy: $likedBy, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.likedBy, likedBy) || other.likedBy == likedBy) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, postId, likedBy, date);

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeImplCopyWith<_$LikeImpl> get copyWith =>
      __$$LikeImplCopyWithImpl<_$LikeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikeImplToJson(this);
  }
}

abstract class _Like implements Like {
  const factory _Like({
    @JsonKey(name: FirebaseFieldName.postId) required final String postId,
    @JsonKey(name: FirebaseFieldName.userId) required final String likedBy,
    @JsonKey(name: FirebaseFieldName.date) required final DateTime date,
  }) = _$LikeImpl;

  factory _Like.fromJson(Map<String, dynamic> json) = _$LikeImpl.fromJson;

  @override
  @JsonKey(name: FirebaseFieldName.postId)
  String get postId;
  @override
  @JsonKey(name: FirebaseFieldName.userId)
  String get likedBy;
  @override
  @JsonKey(name: FirebaseFieldName.date)
  DateTime get date;

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeImplCopyWith<_$LikeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
