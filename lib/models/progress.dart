import 'dart:convert';

class Progress {
  final String name;
  final List<String> images;
  String? id;
  Progress({
    required this.name,
    required this.images,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'images': images});
    if(id != null){
      result.addAll({'id': id});
    }
  
    return result;
  }

  factory Progress.fromMap(Map<String, dynamic> map) {
    return Progress(
      name: map['name'] ?? '',
      images: List<String>.from(map['images']),
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Progress.fromJson(String source) => Progress.fromMap(json.decode(source));
}
