// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(
  Map<String, dynamic> json,
) => _$ProductImpl(
  id: json['id'] as String,
  styleName: json['styleName'] as String,
  description: json['description'] as String,
  descriptionShort: json['descriptionShort'] as String,
  price: json['price'] as String,
  color: json['color'] as String,
  imageUrl: json['imageUrl'] as String,
  productLink: json['productLink'] as String,
  cushioning: json['cushioning'] as String?,
  fit: json['fit'] as String?,
  activities:
      (json['activities'] as List<dynamic>?)?.map((e) => e as String).toList(),
  styleUsps:
      (json['styleUsps'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'styleName': instance.styleName,
      'description': instance.description,
      'descriptionShort': instance.descriptionShort,
      'price': instance.price,
      'color': instance.color,
      'imageUrl': instance.imageUrl,
      'productLink': instance.productLink,
      'cushioning': instance.cushioning,
      'fit': instance.fit,
      'activities': instance.activities,
      'styleUsps': instance.styleUsps,
    };
