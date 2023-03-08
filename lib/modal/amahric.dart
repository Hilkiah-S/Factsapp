// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Amharic {
final String general;
final String lifeHack;
final String animals;
final String sport;
final String science;
final String sex;
final String humanBody;
final String university;
  Amharic({
    required this.general,
    required this.lifeHack,
    required this.animals,
    required this.sport,
    required this.science,
    required this.sex,
    required this.humanBody,
    required this.university,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'general': general,
      'lifeHack': lifeHack,
      'animals': animals,
      'sport': sport,
      'science': science,
      'sex': sex,
      'humanBody': humanBody,
      'university': university,
    };
  }

  factory Amharic.fromMap(Map<String, dynamic> map) {
    return Amharic(
      general: map['General'] as String,
      lifeHack: map['Life_hack'] as String,
      animals: map['Animals'] as String,
      sport: map['Sport'] as String,
      science: map['Science'] as String,
      sex: map['Sex'] as String,
      humanBody: map['Human_Body'] as String,
      university: map['Universe'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Amharic.fromJson(String source) => Amharic.fromMap(json.decode(source) as Map<String, dynamic>);
}
