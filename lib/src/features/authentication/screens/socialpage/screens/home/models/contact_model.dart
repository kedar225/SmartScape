import 'package:flutter/material.dart';

class EmergencyContact {
  final String name;
  final String number;
  final String category;
  final IconData icon;
  final Color color;
  final String? description;

  EmergencyContact({
    required this.name,
    required this.number,
    required this.category,
    required this.icon,
    required this.color,
    this.description,
  });
}
