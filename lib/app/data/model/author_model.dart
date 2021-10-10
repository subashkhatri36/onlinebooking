import 'dart:convert';

class Author {
  final String name;
  final String about;
  final String profilePic;
  Author({
    required this.name,
    required this.about,
    required this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'about': about,
      'profilePic': profilePic,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      name: map['name'],
      about: map['about'],
      profilePic: map['profilePic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) => Author.fromMap(json.decode(source));
}
