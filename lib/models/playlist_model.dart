import 'dart:convert';

class PlaylistModel {
  final String id;
  final String workoutName;
  final List<String> images;
  final String category;
  final String description;
  final String playlistName;
  PlaylistModel({
    required this.id,
    required this.workoutName,
    required this.images,
    required this.category,
    required this.description,
    required this.playlistName,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'workoutName': workoutName});
    result.addAll({'images': images});
    result.addAll({'category': category});
    result.addAll({'description': description});
    result.addAll({'playlistName': playlistName});

    return result;
  }

  factory PlaylistModel.fromMap(Map<String, dynamic> map) {
    return PlaylistModel(
      id: map['_id'] ?? '',
      workoutName: map['workoutName'] ?? '',
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      description: map['description'] ?? '',
      playlistName: map['playlistName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistModel.fromJson(String source) =>
      PlaylistModel.fromMap(json.decode(source));
}
