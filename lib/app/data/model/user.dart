import 'dart:convert';

/*
{
    "id": 3,
    "name": "Sudeep",
    "email": "bjr.sudeep@gmail.com",
    "role_id": "2",
    "email_verified_at": "2021-09-29T07:19:07.000000Z",
    "status": "1",
    "created_at": "2021-09-29T07:19:07.000000Z",
    "updated_at": "2021-09-29T07:19:07.000000Z"
}

 */

class User {
  final int id;
  final String name;
  final String email;
  final int roleId;
  final DateTime emailVerifiedAt;
  final String rememberToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.roleId,
      required this.emailVerifiedAt,
      required this.rememberToken,
      required this.createdAt,
      required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'roleId': roleId,
      'email_verified_at': emailVerifiedAt.millisecondsSinceEpoch,

      'rememberToken': rememberToken,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      roleId: map['roleId'],
      emailVerifiedAt:
          DateTime.fromMillisecondsSinceEpoch(map['email_verified_at']),
    
      rememberToken: map['rememberToken'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
