import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String styleName,
    required String description,
    required String descriptionShort,
    required String price,
    required String color,
    required String imageUrl,
    required String productLink,
    String? cushioning,
    String? fit,
    List<String>? activities,
    List<String>? styleUsps,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.fromApiResult(Map<String, dynamic> result) {
    final metadata = result['metadata']['meta'] as Map<String, dynamic>;
    final variant =
        (metadata['variants'] as List).first as Map<String, dynamic>;

    // Parse style USPs from string format
    List<String> parseStyleUsps(String? styleUspsString) {
      if (styleUspsString == null || styleUspsString.isEmpty) return [];

      // Remove outer quotes and split by ","
      final cleaned = styleUspsString.replaceAll(RegExp(r'^"|"$'), '');
      return cleaned
          .split('","')
          .map((usp) => usp.replaceAll('"', '').trim())
          .where((usp) => usp.isNotEmpty)
          .toList();
    }

    // Parse activities from string format
    List<String> parseActivities(String? activitiesString) {
      if (activitiesString == null || activitiesString.isEmpty) return [];
      return activitiesString.split(', ').map((a) => a.trim()).toList();
    }

    return Product(
      id: result['id'] as String,
      styleName: metadata['style_name'] as String,
      description: metadata['description'] as String,
      descriptionShort: metadata['description_short'] as String,
      price: variant['price'] as String,
      color: variant['color'] as String,
      imageUrl: variant['image_link'] as String,
      productLink: variant['link'] as String,
      cushioning: metadata['cushioning'] as String?,
      fit: metadata['fit'] as String?,
      activities: parseActivities(metadata['activities'] as String?),
      styleUsps: parseStyleUsps(metadata['style_usps'] as String?),
    );
  }
}
