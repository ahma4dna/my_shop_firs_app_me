import 'package:my_shop/featurers/product/model/product_model.dart';

class LikeModel {
  String? id;
  DateTime? createdAt;
  String? forProduct;
  String? forUser;
  ProductModel? products;

  LikeModel({
    this.id,
    this.createdAt,
    this.forProduct,
    this.forUser,
    this.products,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) => LikeModel(
        id: json['id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        forProduct: json['for_product'] as String?,
        forUser: json['for_user'] as String?,
        products: json['products'] == null
            ? null
            : ProductModel.fromJson(json['products'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'for_product': forProduct,
        'for_user': forUser,
        'products': products?.toJson(),
      };
}
