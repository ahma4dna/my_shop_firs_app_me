class Products {
  String? marka;
  String? price;
  String? catrgory;
  DateTime? createdAt;
  String? productId;
  String? descripsion;
  String? productTitle;
  List<String>? listUrlImage;

  Products({
    this.marka,
    this.price,
    this.catrgory,
    this.createdAt,
    this.productId,
    this.descripsion,
    this.productTitle,
    this.listUrlImage,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        marka: json['marka'] as String?,
        price: json['price'] as String?,
        catrgory: json['catrgory'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        productId: json['product_id'] as String?,
        descripsion: json['descripsion'] as String?,
        productTitle: json['product_title'] as String?,
        listUrlImage: (json['list_url_image'] as List<dynamic>?)?.cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'marka': marka,
        'price': price,
        'catrgory': catrgory,
        'created_at': createdAt?.toIso8601String(),
        'product_id': productId,
        'descripsion': descripsion,
        'product_title': productTitle,
        'list_url_image': listUrlImage,
      };
}
