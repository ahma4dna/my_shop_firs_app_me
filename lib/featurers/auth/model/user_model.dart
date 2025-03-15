class UserModel {
  String? idUser;
  DateTime? createdAt;
  String? name;
  String? email;

  UserModel({this.idUser, this.createdAt, this.name, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json['id_user'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        name: json['name'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id_user': idUser,
        'created_at': createdAt?.toIso8601String(),
        'name': name,
        'email': email,
      };
}
