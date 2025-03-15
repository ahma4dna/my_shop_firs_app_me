import 'users.dart';

class ReviewModel {
  String? idReviwe;
  String? createdAt;
  int? rate;
  String? comment;
  dynamic replyAdmine;
  String? forProduct;
  String? forUser;
  Users? users;

  ReviewModel({
    this.idReviwe,
    this.createdAt,
    this.rate,
    this.comment,
    this.replyAdmine,
    this.forProduct,
    this.forUser,
    this.users,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        idReviwe: json['id_reviwe'] as String?,
        createdAt: json['created_at'] as String?,
        rate: json['rate'] as int?,
        comment: json['comment'] as String?,
        replyAdmine: json['reply_admine'] as dynamic,
        forProduct: json['for_product'] as String?,
        forUser: json['for_user'] as String?,
        users: json['users'] == null
            ? null
            : Users.fromJson(json['users'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id_reviwe': idReviwe,
        'created_at': createdAt,
        'rate': rate,
        'comment': comment,
        'reply_admine': replyAdmine,
        'for_product': forProduct,
        'for_user': forUser,
        'users': users?.toJson(),
      };
}
