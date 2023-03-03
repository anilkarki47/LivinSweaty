import 'dart:convert';

class Workout {
  final String name;
  final String count;
  final String target;
  final String description;
  final String catagory;
  final List<String> images;
  final String? id;
  Workout({
    required this.name,
    required this.count,
    required this.target,
    required this.description,
    required this.catagory,
    required this.images,
    this.id,
  });



  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'count': count});
    result.addAll({'target': target});
    result.addAll({'description': description});
    result.addAll({'catagory': catagory});
    result.addAll({'images': images});
    if(id != null){
      result.addAll({'id': id});
    }
  
    return result;
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      name: map['name'] ?? '',
      count: map['count'] ?? '',
      target: map['target'] ?? '',
      description: map['description'] ?? '',
      catagory: map['catagory'] ?? '',
      images: List<String>.from(map['images']),
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Workout.fromJson(String source) => Workout.fromMap(json.decode(source));

}
