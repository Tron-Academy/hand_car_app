// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addressApiServiceHash() => r'cab0df82bafee5385883531fd5a1427d660ccb4b';

/// See also [addressApiService].
@ProviderFor(addressApiService)
final addressApiServiceProvider = AutoDisposeProvider<AddressService>.internal(
  addressApiService,
  name: r'addressApiServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addressApiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddressApiServiceRef = AutoDisposeProviderRef<AddressService>;
String _$addressControllerHash() => r'228be9755edb754ee08357fa548f526ffa1a0f09';

/// See also [AddressController].
@ProviderFor(AddressController)
final addressControllerProvider =
    NotifierProvider<AddressController, AddressState>.internal(
  AddressController.new,
  name: r'addressControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addressControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddressController = Notifier<AddressState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
