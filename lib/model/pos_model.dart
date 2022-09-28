import 'dart:typed_data';

class Pos {
  final int? id;
  final String title;
  final String description;
  final Uint8List? picture;

  Pos({
    required this.id,
    required this.title,
    required this.description,
    required this.picture, 
  });

  factory Pos.fromJson(Map<String, dynamic> json) => Pos(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        picture: json['picture'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'picture': picture,
      };
}
