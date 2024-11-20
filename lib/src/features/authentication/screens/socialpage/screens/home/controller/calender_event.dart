import 'package:flutter/material.dart';

class CalendarEvent {
  final String title;
  final String description;
  final DateTime dateTime;
  final Color color;
  final String location;
  final String type;

  CalendarEvent({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.color,
    required this.location,
    required this.type,
  });
}
