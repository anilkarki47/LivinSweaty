import 'dart:convert';

class WaterIntakeData {
  final String id;
  final int waterIntake;
  final String date;
  WaterIntakeData({
    required this.id,
    required this.waterIntake,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'waterIntake': waterIntake});
    result.addAll({'date': date});

    return result;
  }

  factory WaterIntakeData.fromMap(Map<String, dynamic> map) {
    return WaterIntakeData(
      id: map['_id'] ?? '',
      waterIntake: map['waterIntake'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WaterIntakeData.fromJson(String source) =>
      WaterIntakeData.fromMap(json.decode(source));
}
