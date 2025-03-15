class Users {
  String? name;
  String? email;
  String? idUser;
  DateTime? createdAt;

  Users({this.name, this.email, this.idUser, this.createdAt});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json['name'] as String?,
        email: json['email'] as String?,
        idUser: json['id_user'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'id_user': idUser,
        'created_at': createdAt?.toIso8601String(),
      };
}
