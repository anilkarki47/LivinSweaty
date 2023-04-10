import 'dart:convert';

class MainPlaylist {
  final String? id;
  final String playlistId;
  final String workoutId;
  MainPlaylist({
    this.id,
    required this.playlistId,
    required this.workoutId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'playlistId': playlistId});
    result.addAll({'workoutId': workoutId});

    return result;
  }

  factory MainPlaylist.fromMap(Map<String, dynamic> map) {
    return MainPlaylist(
      id: map['_id'],
      playlistId: map['playlistId'] ?? '',
      workoutId: map['workoutId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MainPlaylist.fromJson(String source) =>
      MainPlaylist.fromMap(json.decode(source));
}
