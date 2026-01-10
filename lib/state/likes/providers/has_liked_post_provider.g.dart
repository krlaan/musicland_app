// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'has_liked_post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hasLikedPostHash() => r'e20052974cf0ccaa5bcd9833b9351c36faa5bd08';

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

/// See also [hasLikedPost].
@ProviderFor(hasLikedPost)
const hasLikedPostProvider = HasLikedPostFamily();

/// See also [hasLikedPost].
class HasLikedPostFamily extends Family<AsyncValue<bool>> {
  /// See also [hasLikedPost].
  const HasLikedPostFamily();

  /// See also [hasLikedPost].
  HasLikedPostProvider call(
      String postId,
      ) {
    return HasLikedPostProvider(
      postId,
    );
  }

  @override
  HasLikedPostProvider getProviderOverride(
      covariant HasLikedPostProvider provider,
      ) {
    return call(
      provider.postId,
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
  String? get name => r'hasLikedPostProvider';
}

/// See also [hasLikedPost].
class HasLikedPostProvider extends AutoDisposeStreamProvider<bool> {
  /// See also [hasLikedPost].
  HasLikedPostProvider(
      String postId,
      ) : this._internal(
        (ref) => hasLikedPost(
      ref as HasLikedPostRef,
      postId,
    ),
    from: hasLikedPostProvider,
    name: r'hasLikedPostProvider',
    debugGetCreateSourceHash:
    const bool.fromEnvironment('dart.vm.product')
        ? null
        : _$hasLikedPostHash,
    dependencies: HasLikedPostFamily._dependencies,
    allTransitiveDependencies:
    HasLikedPostFamily._allTransitiveDependencies,
    postId: postId,
  );

  HasLikedPostProvider._internal(
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
      Stream<bool> Function(HasLikedPostRef provider) create,
      ) {
    return ProviderOverride(
      origin: this,
      override: HasLikedPostProvider._internal(
            (ref) => create(ref as HasLikedPostRef),
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
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _HasLikedPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HasLikedPostProvider && other.postId == postId;
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
mixin HasLikedPostRef on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _HasLikedPostProviderElement
    extends AutoDisposeStreamProviderElement<bool> with HasLikedPostRef {
  _HasLikedPostProviderElement(super.provider);

  @override
  String get postId => (origin as HasLikedPostProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
