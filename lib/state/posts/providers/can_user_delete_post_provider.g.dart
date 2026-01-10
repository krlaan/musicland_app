// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'can_user_delete_post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$canUserDeletePostHash() => r'93ec9ad70a13fb479bc11f58dc3beacfae5ba1ed';

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

/// See also [canUserDeletePost].
@ProviderFor(canUserDeletePost)
const canUserDeletePostProvider = CanUserDeletePostFamily();

/// See also [canUserDeletePost].
class CanUserDeletePostFamily extends Family<AsyncValue<bool>> {
  /// See also [canUserDeletePost].
  const CanUserDeletePostFamily();

  /// See also [canUserDeletePost].
  CanUserDeletePostProvider call(
      String postUserId,
      ) {
    return CanUserDeletePostProvider(
      postUserId,
    );
  }

  @override
  CanUserDeletePostProvider getProviderOverride(
      covariant CanUserDeletePostProvider provider,
      ) {
    return call(
      provider.postUserId,
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
  String? get name => r'canUserDeletePostProvider';
}

/// See also [canUserDeletePost].
class CanUserDeletePostProvider extends AutoDisposeStreamProvider<bool> {
  /// See also [canUserDeletePost].
  CanUserDeletePostProvider(
      String postUserId,
      ) : this._internal(
        (ref) => canUserDeletePost(
      ref as CanUserDeletePostRef,
      postUserId,
    ),
    from: canUserDeletePostProvider,
    name: r'canUserDeletePostProvider',
    debugGetCreateSourceHash:
    const bool.fromEnvironment('dart.vm.product')
        ? null
        : _$canUserDeletePostHash,
    dependencies: CanUserDeletePostFamily._dependencies,
    allTransitiveDependencies:
    CanUserDeletePostFamily._allTransitiveDependencies,
    postUserId: postUserId,
  );

  CanUserDeletePostProvider._internal(
      super._createNotifier, {
        required super.name,
        required super.dependencies,
        required super.allTransitiveDependencies,
        required super.debugGetCreateSourceHash,
        required super.from,
        required this.postUserId,
      }) : super.internal();

  final String postUserId;

  @override
  Override overrideWith(
      Stream<bool> Function(CanUserDeletePostRef provider) create,
      ) {
    return ProviderOverride(
      origin: this,
      override: CanUserDeletePostProvider._internal(
            (ref) => create(ref as CanUserDeletePostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postUserId: postUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _CanUserDeletePostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CanUserDeletePostProvider && other.postUserId == postUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CanUserDeletePostRef on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `postUserId` of this provider.
  String get postUserId;
}

class _CanUserDeletePostProviderElement
    extends AutoDisposeStreamProviderElement<bool> with CanUserDeletePostRef {
  _CanUserDeletePostProviderElement(super.provider);

  @override
  String get postUserId => (origin as CanUserDeletePostProvider).postUserId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
