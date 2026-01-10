// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_dislike_post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likeDislikePostHash() => r'20e7fd29506030bb7042b17105f0ee467b18eda8';

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

abstract class _$LikeDislikePost
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final LikeDislikeRequest request;

  FutureOr<bool> build({
    required LikeDislikeRequest request,
  });
}

/// See also [LikeDislikePost].
@ProviderFor(LikeDislikePost)
const likeDislikePostProvider = LikeDislikePostFamily();

/// See also [LikeDislikePost].
class LikeDislikePostFamily extends Family<AsyncValue<bool>> {
  /// See also [LikeDislikePost].
  const LikeDislikePostFamily();

  /// See also [LikeDislikePost].
  LikeDislikePostProvider call({
    required LikeDislikeRequest request,
  }) {
    return LikeDislikePostProvider(
      request: request,
    );
  }

  @override
  LikeDislikePostProvider getProviderOverride(
      covariant LikeDislikePostProvider provider,
      ) {
    return call(
      request: provider.request,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'likeDislikePostProvider';
}

/// See also [LikeDislikePost].
class LikeDislikePostProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LikeDislikePost, bool> {
  /// See also [LikeDislikePost].
  LikeDislikePostProvider({
    required LikeDislikeRequest request,
  }) : this._internal(
        () => LikeDislikePost()..request = request,
    from: likeDislikePostProvider,
    name: r'likeDislikePostProvider',
    debugGetCreateSourceHash:
    const bool.fromEnvironment('dart.vm.product')
        ? null
        : _$likeDislikePostHash,
    dependencies: LikeDislikePostFamily._dependencies,
    allTransitiveDependencies:
    LikeDislikePostFamily._allTransitiveDependencies,
    request: request,
  );

  LikeDislikePostProvider._internal(
      super._createNotifier, {
        required super.name,
        required super.dependencies,
        required super.allTransitiveDependencies,
        required super.debugGetCreateSourceHash,
        required super.from,
        required this.request,
      }) : super.internal();

  final LikeDislikeRequest request;

  @override
  FutureOr<bool> runNotifierBuild(
      covariant LikeDislikePost notifier,
      ) {
    return notifier.build(
      request: request,
    );
  }

  @override
  Override overrideWith(LikeDislikePost Function() create) {
    return ProviderOverride(
      origin: this,
      override: LikeDislikePostProvider._internal(
            () => create()..request = request,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LikeDislikePost, bool>
  createElement() {
    return _LikeDislikePostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikeDislikePostProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LikeDislikePostRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `request` of this provider.
  LikeDislikeRequest get request;
}

class _LikeDislikePostProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LikeDislikePost, bool>
    with LikeDislikePostRef {
  _LikeDislikePostProviderElement(super.provider);

  @override
  LikeDislikeRequest get request => (origin as LikeDislikePostProvider).request;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
