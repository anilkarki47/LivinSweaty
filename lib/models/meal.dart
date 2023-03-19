import 'dart:convert';

class Meal {
  final String name;
  final String prepTime;
  final String description;
  final String ingredients;
  final String instructions;
  final String category;
  final List<String> images;
  final String? id;
  Meal({
    required this.name,
    required this.prepTime,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.category,
    required this.images,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'prepTime': prepTime});
    result.addAll({'description': description});
    result.addAll({'ingredients': ingredients});
    result.addAll({'instructions': instructions});
    result.addAll({'category': category});
    result.addAll({'images': images});
    if(id != null){
      result.addAll({'id': id});
    }
  
    return result;
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      name: map['name'] ?? '',
      prepTime: map['prepTime'] ?? '',
      description: map['description'] ?? '',
      ingredients: map['ingredients'] ?? '',
      instructions: map['instructions'] ?? '',
      category: map['category'] ?? '',
      images: List<String>.from(map['images']),
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source));
}
