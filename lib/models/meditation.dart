import 'dart:convert';

class Meditation {
  final String name;
  final String artist;
  final String duration;
  final String link;
  final String? id;
  Meditation({
    required this.name,
    required this.artist,
    required this.duration,
    required this.link,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'artist': artist});
    result.addAll({'duration': duration});
    result.addAll({'link': link});
    if (id != null) {
      result.addAll({'id': id});
    }

    return result;
  }

  factory Meditation.fromMap(Map<String, dynamic> map) {
    return Meditation(
      name: map['name'] ?? '',
      artist: map['artist'] ?? '',
      duration: map['duration'] ?? '',
      link: map['link'] ?? '',
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Meditation.fromJson(String source) =>
      Meditation.fromMap(json.decode(source));
}
