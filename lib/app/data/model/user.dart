import 'dart:convert';

/*
"id": "3",
        "name": "Vineeth v",
        "status": "1",
        "last_login_time": "1630219340",
        "last_login_ip": "127.0.0.1",
        "token": "ut-d03

 */

class User {
  final int id;
  final String name;
  final bool status;
  final DateTime lastlogin;
  final String loginIp;
  final String token;
  User({
    required this.id,
    required this.name,
    required this.status,
    required this.lastlogin,
    required this.loginIp,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'last_login_time': lastlogin.millisecondsSinceEpoch,
      'last_login_ip': loginIp,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      status: map['status'] == 1 ? true : false,
      lastlogin: DateTime.fromMillisecondsSinceEpoch(map['last_login_time']),
      loginIp: map['last_login_ip'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
