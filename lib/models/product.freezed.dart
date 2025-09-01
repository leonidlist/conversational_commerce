// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get id => throw _privateConstructorUsedError;
  String get styleName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get descriptionShort => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get productLink => throw _privateConstructorUsedError;
  String? get cushioning => throw _privateConstructorUsedError;
  String? get fit => throw _privateConstructorUsedError;
  List<String>? get activities => throw _privateConstructorUsedError;
  List<String>? get styleUsps => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({
    String id,
    String styleName,
    String description,
    String descriptionShort,
    String price,
    String color,
    String imageUrl,
    String productLink,
    String? cushioning,
    String? fit,
    List<String>? activities,
    List<String>? styleUsps,
  });
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? styleName = null,
    Object? description = null,
    Object? descriptionShort = null,
    Object? price = null,
    Object? color = null,
    Object? imageUrl = null,
    Object? productLink = null,
    Object? cushioning = freezed,
    Object? fit = freezed,
    Object? activities = freezed,
    Object? styleUsps = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            styleName:
                null == styleName
                    ? _value.styleName
                    : styleName // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            descriptionShort:
                null == descriptionShort
                    ? _value.descriptionShort
                    : descriptionShort // ignore: cast_nullable_to_non_nullable
                        as String,
            price:
                null == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as String,
            color:
                null == color
                    ? _value.color
                    : color // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                null == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            productLink:
                null == productLink
                    ? _value.productLink
                    : productLink // ignore: cast_nullable_to_non_nullable
                        as String,
            cushioning:
                freezed == cushioning
                    ? _value.cushioning
                    : cushioning // ignore: cast_nullable_to_non_nullable
                        as String?,
            fit:
                freezed == fit
                    ? _value.fit
                    : fit // ignore: cast_nullable_to_non_nullable
                        as String?,
            activities:
                freezed == activities
                    ? _value.activities
                    : activities // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            styleUsps:
                freezed == styleUsps
                    ? _value.styleUsps
                    : styleUsps // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
    _$ProductImpl value,
    $Res Function(_$ProductImpl) then,
  ) = __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String styleName,
    String description,
    String descriptionShort,
    String price,
    String color,
    String imageUrl,
    String productLink,
    String? cushioning,
    String? fit,
    List<String>? activities,
    List<String>? styleUsps,
  });
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
    _$ProductImpl _value,
    $Res Function(_$ProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? styleName = null,
    Object? description = null,
    Object? descriptionShort = null,
    Object? price = null,
    Object? color = null,
    Object? imageUrl = null,
    Object? productLink = null,
    Object? cushioning = freezed,
    Object? fit = freezed,
    Object? activities = freezed,
    Object? styleUsps = freezed,
  }) {
    return _then(
      _$ProductImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        styleName:
            null == styleName
                ? _value.styleName
                : styleName // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        descriptionShort:
            null == descriptionShort
                ? _value.descriptionShort
                : descriptionShort // ignore: cast_nullable_to_non_nullable
                    as String,
        price:
            null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as String,
        color:
            null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        productLink:
            null == productLink
                ? _value.productLink
                : productLink // ignore: cast_nullable_to_non_nullable
                    as String,
        cushioning:
            freezed == cushioning
                ? _value.cushioning
                : cushioning // ignore: cast_nullable_to_non_nullable
                    as String?,
        fit:
            freezed == fit
                ? _value.fit
                : fit // ignore: cast_nullable_to_non_nullable
                    as String?,
        activities:
            freezed == activities
                ? _value._activities
                : activities // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        styleUsps:
            freezed == styleUsps
                ? _value._styleUsps
                : styleUsps // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl({
    required this.id,
    required this.styleName,
    required this.description,
    required this.descriptionShort,
    required this.price,
    required this.color,
    required this.imageUrl,
    required this.productLink,
    this.cushioning,
    this.fit,
    final List<String>? activities,
    final List<String>? styleUsps,
  }) : _activities = activities,
       _styleUsps = styleUsps;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String id;
  @override
  final String styleName;
  @override
  final String description;
  @override
  final String descriptionShort;
  @override
  final String price;
  @override
  final String color;
  @override
  final String imageUrl;
  @override
  final String productLink;
  @override
  final String? cushioning;
  @override
  final String? fit;
  final List<String>? _activities;
  @override
  List<String>? get activities {
    final value = _activities;
    if (value == null) return null;
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _styleUsps;
  @override
  List<String>? get styleUsps {
    final value = _styleUsps;
    if (value == null) return null;
    if (_styleUsps is EqualUnmodifiableListView) return _styleUsps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Product(id: $id, styleName: $styleName, description: $description, descriptionShort: $descriptionShort, price: $price, color: $color, imageUrl: $imageUrl, productLink: $productLink, cushioning: $cushioning, fit: $fit, activities: $activities, styleUsps: $styleUsps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.styleName, styleName) ||
                other.styleName == styleName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionShort, descriptionShort) ||
                other.descriptionShort == descriptionShort) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.productLink, productLink) ||
                other.productLink == productLink) &&
            (identical(other.cushioning, cushioning) ||
                other.cushioning == cushioning) &&
            (identical(other.fit, fit) || other.fit == fit) &&
            const DeepCollectionEquality().equals(
              other._activities,
              _activities,
            ) &&
            const DeepCollectionEquality().equals(
              other._styleUsps,
              _styleUsps,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    styleName,
    description,
    descriptionShort,
    price,
    color,
    imageUrl,
    productLink,
    cushioning,
    fit,
    const DeepCollectionEquality().hash(_activities),
    const DeepCollectionEquality().hash(_styleUsps),
  );

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product({
    required final String id,
    required final String styleName,
    required final String description,
    required final String descriptionShort,
    required final String price,
    required final String color,
    required final String imageUrl,
    required final String productLink,
    final String? cushioning,
    final String? fit,
    final List<String>? activities,
    final List<String>? styleUsps,
  }) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get id;
  @override
  String get styleName;
  @override
  String get description;
  @override
  String get descriptionShort;
  @override
  String get price;
  @override
  String get color;
  @override
  String get imageUrl;
  @override
  String get productLink;
  @override
  String? get cushioning;
  @override
  String? get fit;
  @override
  List<String>? get activities;
  @override
  List<String>? get styleUsps;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
