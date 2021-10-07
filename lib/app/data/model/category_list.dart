import 'dart:convert';

class CategoryList {
  final int id;
  final String name;
  final String image;
  CategoryList({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CategoryList.fromMap(Map<String, dynamic> map) {
    return CategoryList(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryList.fromJson(String source) =>
      CategoryList.fromMap(json.decode(source));
}
