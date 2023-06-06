import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    required this.icon,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;
  final String icon;
}
