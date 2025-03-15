class ProductModel {
  String? productId;
  DateTime? createdAt;
  String? productTitle;
  String? price;
  String? descripsion;
  List<String>? listUrlImage;
  String? catrgory;
  String? marka;

  ProductModel({
    this.productId,
    this.createdAt,
    this.productTitle,
    this.price,
    this.descripsion,
    this.listUrlImage,
    this.catrgory,
    this.marka,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json['product_id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        productTitle: json['product_title'] as String?,
        price: json['price'] as String?,
        descripsion: json['descripsion'] as String?,
        listUrlImage:
            (json['list_url_image'] as List<dynamic>?)?.cast<String>(),
        catrgory: json['catrgory'] as String?,
        marka: json['marka'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'created_at': createdAt?.toIso8601String(),
        'product_title': productTitle,
        'price': price,
        'descripsion': descripsion,
        'list_url_image': listUrlImage,
        'catrgory': catrgory,
        'marka': marka,
      };
}
