import 'dart:convert';

class Workout {
  final String name;
  final String count;
  final String target;
  final String description;
  final String category;
  final List<String> images;
  final String? id;
  Workout({
    required this.name,
    required this.count,
    required this.target,
    required this.description,
    required this.category,
    required this.images,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'count': count,
      'target': target,
      'images': images,
      'description': description,
      'category': category,
      'id': id,
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      name: map['name'] ?? '',
      count: map['count'] ?? '',
      target: map['target'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      images: List<String>.from(map['images']),
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Workout.fromJson(String source) =>
      Workout.fromMap(json.decode(source));
}
