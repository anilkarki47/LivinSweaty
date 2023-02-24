import 'dart:convert';

class Workout {
  final String name;
  final String description;
  final List<String> images;
  final String? id;
  Workout({
    required this.name,
    required this.description,
    required this.images,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'images': images});
    if (id != null) {
      result.addAll({'id': id});
    }

    return result;
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      images: List<String>.from(map['images']),
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Workout.fromJson(String source) =>
      Workout.fromMap(json.decode(source));
}
