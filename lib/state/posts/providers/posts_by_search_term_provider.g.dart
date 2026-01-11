// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_by_search_term_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postsBySearchTermHash() => r'91ffd5deed0b2169454212a6526053f30979927e';

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

/// See also [postsBySearchTerm].
@ProviderFor(postsBySearchTerm)
const postsBySearchTermProvider = PostsBySearchTermFamily();

/// See also [postsBySearchTerm].
class PostsBySearchTermFamily extends Family<AsyncValue<Iterable<Post>>> {
  /// See also [postsBySearchTerm].
  const PostsBySearchTermFamily();

  /// See also [postsBySearchTerm].
  PostsBySearchTermProvider call(String searchTerm) {
    return PostsBySearchTermProvider(searchTerm);
  }

  @override
  PostsBySearchTermProvider getProviderOverride(
    covariant PostsBySearchTermProvider provider,
  ) {
    return call(provider.searchTerm);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postsBySearchTermProvider';
}

/// See also [postsBySearchTerm].
class PostsBySearchTermProvider
    extends AutoDisposeStreamProvider<Iterable<Post>> {
  /// See also [postsBySearchTerm].
  PostsBySearchTermProvider(String searchTerm)
    : this._internal(
        (ref) => postsBySearchTerm(ref as PostsBySearchTermRef, searchTerm),
        from: postsBySearchTermProvider,
        name: r'postsBySearchTermProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$postsBySearchTermHash,
        dependencies: PostsBySearchTermFamily._dependencies,
        allTransitiveDependencies:
            PostsBySearchTermFamily._allTransitiveDependencies,
        searchTerm: searchTerm,
      );

  PostsBySearchTermProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchTerm,
  }) : super.internal();

  final String searchTerm;

  @override
  Override overrideWith(
    Stream<Iterable<Post>> Function(PostsBySearchTermRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostsBySearchTermProvider._internal(
        (ref) => create(ref as PostsBySearchTermRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchTerm: searchTerm,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Iterable<Post>> createElement() {
    return _PostsBySearchTermProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostsBySearchTermProvider && other.searchTerm == searchTerm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostsBySearchTermRef on AutoDisposeStreamProviderRef<Iterable<Post>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;
}

class _PostsBySearchTermProviderElement
    extends AutoDisposeStreamProviderElement<Iterable<Post>>
    with PostsBySearchTermRef {
  _PostsBySearchTermProviderElement(super.provider);

  @override
  String get searchTerm => (origin as PostsBySearchTermProvider).searchTerm;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
