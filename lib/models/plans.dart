import 'dart:convert';

class Plans {
  final String playlistname;
  final List<String> playlist;
  Plans({
    required this.playlistname,
    required this.playlist,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'playlistname': playlistname});
    result.addAll({'playlist': playlist});
  
    return result;
  }

  factory Plans.fromMap(Map<String, dynamic> map) {
    return Plans(
      playlistname: map['playlistname'] ?? '',
      playlist: List<String>.from(map['playlist']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Plans.fromJson(String source) => Plans.fromMap(json.decode(source));
}
