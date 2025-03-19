import 'products.dart';

class CartModel {
  String? id;
  DateTime? createdAt;
  int? quantiti;
  bool? chachPay;
  String? forProduct;
  String? forUser;
  int? totalPrice;
  Products? products;

  CartModel({
    this.id,
    this.createdAt,
    this.quantiti,
    this.chachPay,
    this.forProduct,
    this.forUser,
    this.totalPrice,
    this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        quantiti: json['quantiti'] as int?,
        chachPay: json['chach_pay'] as bool?,
        forProduct: json['for_product'] as String?,
        forUser: json['for_user'] as String?,
        totalPrice: json['total_price'] as int?,
        products: json['products'] == null
            ? null
            : Products.fromJson(json['products'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'quantiti': quantiti,
        'chach_pay': chachPay,
        'for_product': forProduct,
        'for_user': forUser,
        'total_price': totalPrice,
        'products': products?.toJson(),
      };
}
