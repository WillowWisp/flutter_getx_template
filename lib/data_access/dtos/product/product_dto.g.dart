// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) {
  return ProductDto(
    id: json['id'] as int,
    title: json['title'] as String,
    price: (json['price'] as num).toDouble(),
    description: json['description'] as String,
    category: json['category'] as String,
    rating: ProductRatingDto.fromJson(json['rating'] as Map<String, dynamic>),
    imageUrl: json['image'] as String,
  );
}

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'rating': instance.rating.toJson(),
      'image': instance.imageUrl,
    };

ProductRatingDto _$ProductRatingDtoFromJson(Map<String, dynamic> json) {
  return ProductRatingDto(
    rate: (json['rate'] as num).toDouble(),
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$ProductRatingDtoToJson(ProductRatingDto instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
