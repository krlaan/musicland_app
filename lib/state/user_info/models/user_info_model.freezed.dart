// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return _UserInfoModel.fromJson(json);
}

/// @nodoc
mixin _$UserInfoModel {
  @JsonKey(name: FirebaseFieldName.userId)
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseFieldName.displayName)
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseFieldName.email)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseFieldName.instruments)
  List<String> get instruments => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseFieldName.genres)
  List<String> get genres => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseFieldName.experience)
  String? get experience => throw _privateConstructorUsedError;

  /// Serializes this UserInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoModelCopyWith<UserInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoModelCopyWith<$Res> {
  factory $UserInfoModelCopyWith(
    UserInfoModel value,
    $Res Function(UserInfoModel) then,
  ) = _$UserInfoModelCopyWithImpl<$Res, UserInfoModel>;
  @useResult
  $Res call({
    @JsonKey(name: FirebaseFieldName.userId) String userId,
    @JsonKey(name: FirebaseFieldName.displayName) String displayName,
    @JsonKey(name: FirebaseFieldName.email) String? email,
    @JsonKey(name: FirebaseFieldName.instruments) List<String> instruments,
    @JsonKey(name: FirebaseFieldName.genres) List<String> genres,
    @JsonKey(name: FirebaseFieldName.experience) String? experience,
  });
}

/// @nodoc
class _$UserInfoModelCopyWithImpl<$Res, $Val extends UserInfoModel>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = null,
    Object? email = freezed,
    Object? instruments = null,
    Object? genres = null,
    Object? experience = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            instruments: null == instruments
                ? _value.instruments
                : instruments // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            genres: null == genres
                ? _value.genres
                : genres // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            experience: freezed == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserInfoModelImplCopyWith<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  factory _$$UserInfoModelImplCopyWith(
    _$UserInfoModelImpl value,
    $Res Function(_$UserInfoModelImpl) then,
  ) = __$$UserInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: FirebaseFieldName.userId) String userId,
    @JsonKey(name: FirebaseFieldName.displayName) String displayName,
    @JsonKey(name: FirebaseFieldName.email) String? email,
    @JsonKey(name: FirebaseFieldName.instruments) List<String> instruments,
    @JsonKey(name: FirebaseFieldName.genres) List<String> genres,
    @JsonKey(name: FirebaseFieldName.experience) String? experience,
  });
}

/// @nodoc
class __$$UserInfoModelImplCopyWithImpl<$Res>
    extends _$UserInfoModelCopyWithImpl<$Res, _$UserInfoModelImpl>
    implements _$$UserInfoModelImplCopyWith<$Res> {
  __$$UserInfoModelImplCopyWithImpl(
    _$UserInfoModelImpl _value,
    $Res Function(_$UserInfoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = null,
    Object? email = freezed,
    Object? instruments = null,
    Object? genres = null,
    Object? experience = freezed,
  }) {
    return _then(
      _$UserInfoModelImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        instruments: null == instruments
            ? _value._instruments
            : instruments // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        genres: null == genres
            ? _value._genres
            : genres // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        experience: freezed == experience
            ? _value.experience
            : experience // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoModelImpl implements _UserInfoModel {
  const _$UserInfoModelImpl({
    @JsonKey(name: FirebaseFieldName.userId) required this.userId,
    @JsonKey(name: FirebaseFieldName.displayName) required this.displayName,
    @JsonKey(name: FirebaseFieldName.email) this.email,
    @JsonKey(name: FirebaseFieldName.instruments)
    final List<String> instruments = const [],
    @JsonKey(name: FirebaseFieldName.genres)
    final List<String> genres = const [],
    @JsonKey(name: FirebaseFieldName.experience) this.experience,
  }) : _instruments = instruments,
       _genres = genres;

  factory _$UserInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoModelImplFromJson(json);

  @override
  @JsonKey(name: FirebaseFieldName.userId)
  final String userId;
  @override
  @JsonKey(name: FirebaseFieldName.displayName)
  final String displayName;
  @override
  @JsonKey(name: FirebaseFieldName.email)
  final String? email;
  final List<String> _instruments;
  @override
  @JsonKey(name: FirebaseFieldName.instruments)
  List<String> get instruments {
    if (_instruments is EqualUnmodifiableListView) return _instruments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instruments);
  }

  final List<String> _genres;
  @override
  @JsonKey(name: FirebaseFieldName.genres)
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  @JsonKey(name: FirebaseFieldName.experience)
  final String? experience;

  @override
  String toString() {
    return 'UserInfoModel(userId: $userId, displayName: $displayName, email: $email, instruments: $instruments, genres: $genres, experience: $experience)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(
              other._instruments,
              _instruments,
            ) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.experience, experience) ||
                other.experience == experience));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    displayName,
    email,
    const DeepCollectionEquality().hash(_instruments),
    const DeepCollectionEquality().hash(_genres),
    experience,
  );

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoModelImplCopyWith<_$UserInfoModelImpl> get copyWith =>
      __$$UserInfoModelImplCopyWithImpl<_$UserInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoModelImplToJson(this);
  }
}

abstract class _UserInfoModel implements UserInfoModel {
  const factory _UserInfoModel({
    @JsonKey(name: FirebaseFieldName.userId) required final String userId,
    @JsonKey(name: FirebaseFieldName.displayName)
    required final String displayName,
    @JsonKey(name: FirebaseFieldName.email) final String? email,
    @JsonKey(name: FirebaseFieldName.instruments)
    final List<String> instruments,
    @JsonKey(name: FirebaseFieldName.genres) final List<String> genres,
    @JsonKey(name: FirebaseFieldName.experience) final String? experience,
  }) = _$UserInfoModelImpl;

  factory _UserInfoModel.fromJson(Map<String, dynamic> json) =
      _$UserInfoModelImpl.fromJson;

  @override
  @JsonKey(name: FirebaseFieldName.userId)
  String get userId;
  @override
  @JsonKey(name: FirebaseFieldName.displayName)
  String get displayName;
  @override
  @JsonKey(name: FirebaseFieldName.email)
  String? get email;
  @override
  @JsonKey(name: FirebaseFieldName.instruments)
  List<String> get instruments;
  @override
  @JsonKey(name: FirebaseFieldName.genres)
  List<String> get genres;
  @override
  @JsonKey(name: FirebaseFieldName.experience)
  String? get experience;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoModelImplCopyWith<_$UserInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
