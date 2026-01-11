// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_likes_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postLikesCountHash() => r'328c09272f072c46932d2145680ade6436fc6194';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [postLikesCount].
@ProviderFor(postLikesCount)
const postLikesCountProvider = PostLikesCountFamily();

/// See also [postLikesCount].
class PostLikesCountFamily extends Family<AsyncValue<int>> {
  /// See also [postLikesCount].
  const PostLikesCountFamily();

  /// See also [postLikesCount].
  PostLikesCountProvider call(String postId) {
    return PostLikesCountProvider(postId);
  }

  @override
  PostLikesCountProvider getProviderOverride(
    covariant PostLikesCountProvider provider,
  ) {
    return call(provider.postId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postLikesCountProvider';
}

/// See also [postLikesCount].
class PostLikesCountProvider extends AutoDisposeStreamProvider<int> {
  /// See also [postLikesCount].
  PostLikesCountProvider(String postId)
    : this._internal(
        (ref) => postLikesCount(ref as PostLikesCountRef, postId),
        from: postLikesCountProvider,
        name: r'postLikesCountProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$postLikesCountHash,
        dependencies: PostLikesCountFamily._dependencies,
        allTransitiveDependencies:
            PostLikesCountFamily._allTransitiveDependencies,
        postId: postId,
      );

  PostLikesCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  Override overrideWith(
    Stream<int> Function(PostLikesCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostLikesCountProvider._internal(
        (ref) => create(ref as PostLikesCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<int> createElement() {
    return _PostLikesCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostLikesCountProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostLikesCountRef on AutoDisposeStreamProviderRef<int> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _PostLikesCountProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with PostLikesCountRef {
  _PostLikesCountProviderElement(super.provider);

  @override
  String get postId => (origin as PostLikesCountProvider).postId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
