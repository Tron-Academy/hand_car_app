// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) {
  return _CartResponse.fromJson(json);
}

/// @nodoc
mixin _$CartResponse {
  String? get message => throw _privateConstructorUsedError;
  int? get cartQuantity => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  CouponModel? get appliedCoupon => throw _privateConstructorUsedError;

  /// Serializes this CartResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartResponseCopyWith<CartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResponseCopyWith<$Res> {
  factory $CartResponseCopyWith(
          CartResponse value, $Res Function(CartResponse) then) =
      _$CartResponseCopyWithImpl<$Res, CartResponse>;
  @useResult
  $Res call(
      {String? message,
      int? cartQuantity,
      String? error,
      bool isSuccess,
      CouponModel? appliedCoupon});

  $CouponModelCopyWith<$Res>? get appliedCoupon;
}

/// @nodoc
class _$CartResponseCopyWithImpl<$Res, $Val extends CartResponse>
    implements $CartResponseCopyWith<$Res> {
  _$CartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? cartQuantity = freezed,
    Object? error = freezed,
    Object? isSuccess = null,
    Object? appliedCoupon = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      cartQuantity: freezed == cartQuantity
          ? _value.cartQuantity
          : cartQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedCoupon: freezed == appliedCoupon
          ? _value.appliedCoupon
          : appliedCoupon // ignore: cast_nullable_to_non_nullable
              as CouponModel?,
    ) as $Val);
  }

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CouponModelCopyWith<$Res>? get appliedCoupon {
    if (_value.appliedCoupon == null) {
      return null;
    }

    return $CouponModelCopyWith<$Res>(_value.appliedCoupon!, (value) {
      return _then(_value.copyWith(appliedCoupon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartResponseImplCopyWith<$Res>
    implements $CartResponseCopyWith<$Res> {
  factory _$$CartResponseImplCopyWith(
          _$CartResponseImpl value, $Res Function(_$CartResponseImpl) then) =
      __$$CartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      int? cartQuantity,
      String? error,
      bool isSuccess,
      CouponModel? appliedCoupon});

  @override
  $CouponModelCopyWith<$Res>? get appliedCoupon;
}

/// @nodoc
class __$$CartResponseImplCopyWithImpl<$Res>
    extends _$CartResponseCopyWithImpl<$Res, _$CartResponseImpl>
    implements _$$CartResponseImplCopyWith<$Res> {
  __$$CartResponseImplCopyWithImpl(
      _$CartResponseImpl _value, $Res Function(_$CartResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? cartQuantity = freezed,
    Object? error = freezed,
    Object? isSuccess = null,
    Object? appliedCoupon = freezed,
  }) {
    return _then(_$CartResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      cartQuantity: freezed == cartQuantity
          ? _value.cartQuantity
          : cartQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedCoupon: freezed == appliedCoupon
          ? _value.appliedCoupon
          : appliedCoupon // ignore: cast_nullable_to_non_nullable
              as CouponModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartResponseImpl extends _CartResponse {
  const _$CartResponseImpl(
      {this.message,
      this.cartQuantity,
      this.error,
      this.isSuccess = false,
      this.appliedCoupon})
      : super._();

  factory _$CartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final int? cartQuantity;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final CouponModel? appliedCoupon;

  @override
  String toString() {
    return 'CartResponse(message: $message, cartQuantity: $cartQuantity, error: $error, isSuccess: $isSuccess, appliedCoupon: $appliedCoupon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cartQuantity, cartQuantity) ||
                other.cartQuantity == cartQuantity) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.appliedCoupon, appliedCoupon) ||
                other.appliedCoupon == appliedCoupon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, cartQuantity, error, isSuccess, appliedCoupon);

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartResponseImplCopyWith<_$CartResponseImpl> get copyWith =>
      __$$CartResponseImplCopyWithImpl<_$CartResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartResponseImplToJson(
      this,
    );
  }
}

abstract class _CartResponse extends CartResponse {
  const factory _CartResponse(
      {final String? message,
      final int? cartQuantity,
      final String? error,
      final bool isSuccess,
      final CouponModel? appliedCoupon}) = _$CartResponseImpl;
  const _CartResponse._() : super._();

  factory _CartResponse.fromJson(Map<String, dynamic> json) =
      _$CartResponseImpl.fromJson;

  @override
  String? get message;
  @override
  int? get cartQuantity;
  @override
  String? get error;
  @override
  bool get isSuccess;
  @override
  CouponModel? get appliedCoupon;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartResponseImplCopyWith<_$CartResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
