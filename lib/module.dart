import 'package:flutter/material.dart';

class Module {
  final int? id;
  final String name;

  Module({this.id, required this.name});

  factory Module.fromMap(Map<String, dynamic> json) => new Module(
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