import 'package:flutter/material.dart';

// 메뉴 클래스
class Menu {
  final int? id;
  final String name;

  Menu({this.id, required this.name});

  factory Menu.fromMap(Map<String, dynamic> json) => new Menu(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}