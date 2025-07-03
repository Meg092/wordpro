import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class BulletEntity {
  int id;
  DateTime createdTime;
  String content;
  String wordColor;
  int bgColor;
  int fontFamily;

  BulletEntity({
    required this.id,
    required this.createdTime,
    required this.content,
    required this.wordColor,
    required this.bgColor,
    required this.fontFamily,
  });

  factory BulletEntity.fromJson(Map<String, dynamic> json) {
    return BulletEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      content: json['content'],
      wordColor: json['wordColor'],
      bgColor: json['bgColor'],
      fontFamily: json['fontFamily'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'content': content,
      'wordColor': wordColor,
      'bgColor': bgColor,
      'fontFamily': fontFamily,
    };
  }

  Color get wordColorValue {
    var wordC = wordColor.toColor() ?? Colors.black;
    return wordC;
  }
}