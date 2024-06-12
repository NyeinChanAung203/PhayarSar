// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phayarsar_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$phayarsarTitleControllerHash() =>
    r'5f7168e2a902c2bdd7c5c3ce26ec238198d1424b';

/// See also [phayarsarTitleController].
@ProviderFor(phayarsarTitleController)
final phayarsarTitleControllerProvider =
    FutureProvider<List<PhayarsarTitle>>.internal(
  phayarsarTitleController,
  name: r'phayarsarTitleControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$phayarsarTitleControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PhayarsarTitleControllerRef = FutureProviderRef<List<PhayarsarTitle>>;
String _$phayarsarDetailControllerHash() =>
    r'b0286e9fc7bd00c93c1d4eaace493358ded0922d';

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

abstract class _$PhayarsarDetailController
    extends BuildlessAutoDisposeAsyncNotifier<PhayarsarDetail> {
  late final String groupId;
  late final String id;

  FutureOr<PhayarsarDetail> build({
    required String groupId,
    required String id,
  });
}

/// See also [PhayarsarDetailController].
@ProviderFor(PhayarsarDetailController)
const phayarsarDetailControllerProvider = PhayarsarDetailControllerFamily();

/// See also [PhayarsarDetailController].
class PhayarsarDetailControllerFamily
    extends Family<AsyncValue<PhayarsarDetail>> {
  /// See also [PhayarsarDetailController].
  const PhayarsarDetailControllerFamily();

  /// See also [PhayarsarDetailController].
  PhayarsarDetailControllerProvider call({
    required String groupId,
    required String id,
  }) {
    return PhayarsarDetailControllerProvider(
      groupId: groupId,
      id: id,
    );
  }

  @override
  PhayarsarDetailControllerProvider getProviderOverride(
    covariant PhayarsarDetailControllerProvider provider,
  ) {
    return call(
      groupId: provider.groupId,
      id: provider.id,
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
  String? get name => r'phayarsarDetailControllerProvider';
}

/// See also [PhayarsarDetailController].
class PhayarsarDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PhayarsarDetailController,
        PhayarsarDetail> {
  /// See also [PhayarsarDetailController].
  PhayarsarDetailControllerProvider({
    required String groupId,
    required String id,
  }) : this._internal(
          () => PhayarsarDetailController()
            ..groupId = groupId
            ..id = id,
          from: phayarsarDetailControllerProvider,
          name: r'phayarsarDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$phayarsarDetailControllerHash,
          dependencies: PhayarsarDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              PhayarsarDetailControllerFamily._allTransitiveDependencies,
          groupId: groupId,
          id: id,
        );

  PhayarsarDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
    required this.id,
  }) : super.internal();

  final String groupId;
  final String id;

  @override
  FutureOr<PhayarsarDetail> runNotifierBuild(
    covariant PhayarsarDetailController notifier,
  ) {
    return notifier.build(
      groupId: groupId,
      id: id,
    );
  }

  @override
  Override overrideWith(PhayarsarDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PhayarsarDetailControllerProvider._internal(
        () => create()
          ..groupId = groupId
          ..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PhayarsarDetailController,
      PhayarsarDetail> createElement() {
    return _PhayarsarDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PhayarsarDetailControllerProvider &&
        other.groupId == groupId &&
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PhayarsarDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<PhayarsarDetail> {
  /// The parameter `groupId` of this provider.
  String get groupId;

  /// The parameter `id` of this provider.
  String get id;
}

class _PhayarsarDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PhayarsarDetailController,
        PhayarsarDetail> with PhayarsarDetailControllerRef {
  _PhayarsarDetailControllerProviderElement(super.provider);

  @override
  String get groupId => (origin as PhayarsarDetailControllerProvider).groupId;
  @override
  String get id => (origin as PhayarsarDetailControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
