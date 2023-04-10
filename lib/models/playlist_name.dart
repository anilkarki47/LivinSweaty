import 'dart:convert';

class PlaylistName {
  final String? id;
  final String name;
  PlaylistName({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'name': name});

    return result;
  }

  factory PlaylistName.fromMap(Map<String, dynamic> map) {
    return PlaylistName(
      id: map['_id'],
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistName.fromJson(String source) =>
      PlaylistName.fromMap(json.decode(source));
}
