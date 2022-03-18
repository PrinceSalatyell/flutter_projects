import 'package:quizz_app/model/user.dart';

final String tableUsers = "users";

class UserFields {
  static final List<String> values = [
    id, username, highestScore, scoreDate
  ];

  static final String id = '_id';
  static final String username = 'Username';
  static final String highestScore = 'Highest Score';
  static final String scoreDate = 'Date';
}

class User {
  final int? id;
  final String username;
  final int highestScore;
  final DateTime scoreDate;

  const User(
      {this.id,
      required this.username,
      required this.highestScore,
      required this.scoreDate});

  User copy({
    int? id,
    String? username,
    int? highestScore,
    DateTime? scoreDate,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        highestScore: highestScore ?? this.highestScore,
        scoreDate: scoreDate ?? this.scoreDate,
      );

  static User fromJson(Map<String, Object?> json) => User(
    id: json[UserFields.id] as int?,
    username: json[UserFields.username] as String,
    highestScore: json[UserFields.highestScore] as int,
    scoreDate: DateTime.parse(json[UserFields.scoreDate] as String)
  );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.username: username,
        UserFields.highestScore: highestScore,
        UserFields.scoreDate: scoreDate.toIso8601String()
      };
}
