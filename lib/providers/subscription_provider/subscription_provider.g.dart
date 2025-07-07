// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subscribeHash() => r'16d2c7020fda8d8994397b0ecc3f3faa547ef3d0';

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

/// See also [subscribe].
@ProviderFor(subscribe)
const subscribeProvider = SubscribeFamily();

/// See also [subscribe].
class SubscribeFamily extends Family<AsyncValue<void>> {
  /// See also [subscribe].
  const SubscribeFamily();

  /// See also [subscribe].
  SubscribeProvider call(String email) {
    return SubscribeProvider(email);
  }

  @override
  SubscribeProvider getProviderOverride(covariant SubscribeProvider provider) {
    return call(provider.email);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'subscribeProvider';
}

/// See also [subscribe].
class SubscribeProvider extends AutoDisposeFutureProvider<void> {
  /// See also [subscribe].
  SubscribeProvider(String email)
    : this._internal(
        (ref) => subscribe(ref as SubscribeRef, email),
        from: subscribeProvider,
        name: r'subscribeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$subscribeHash,
        dependencies: SubscribeFamily._dependencies,
        allTransitiveDependencies: SubscribeFamily._allTransitiveDependencies,
        email: email,
      );

  SubscribeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(FutureOr<void> Function(SubscribeRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: SubscribeProvider._internal(
        (ref) => create(ref as SubscribeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SubscribeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubscribeProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubscribeRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;
}

class _SubscribeProviderElement extends AutoDisposeFutureProviderElement<void>
    with SubscribeRef {
  _SubscribeProviderElement(super.provider);

  @override
  String get email => (origin as SubscribeProvider).email;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
