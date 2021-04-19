import 'package:flutter/material.dart';

class PostModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  PostModel({
    @required this.id,
    @required this.userId,
    @required this.title,
    @required this.body,
  });

  PostModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      userId = json['userId'],
      title = json['title'],
      body = json['body'];

}
