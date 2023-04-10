import 'dart:convert';

import 'package:livin_sweaty/features/account/playlist/playlist.dart';

class Plans {
  final String? id;
  final String playlistname;
  final Map<String, List<Workout>> playlist;
  Plans({
    this.id,
    required this.playlistname,
    required this.playlist,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    result.addAll({'playlistname': playlistname});
    result.addAll({'playlist': playlist});
  
    return result;
  }

  factory Plans.fromMap(Map<String, dynamic> map) {
    return Plans(
      id: map['id'],
      playlistname: map['playlistname'] ?? '',
      playlist: Map<String, List<Workout>>.from(map['playlist']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Plans.fromJson(String source) => Plans.fromMap(json.decode(source));
}
