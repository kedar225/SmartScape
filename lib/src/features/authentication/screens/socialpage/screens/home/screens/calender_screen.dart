import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/event/widget/event_card.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/controller/calender_event.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<CalendarEvent>> _events = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    // Initialize with sample events
    _initializeEvents();
  }

  void _initializeEvents() {
    // Sample events
    final today = DateTime.now();
    _events = {
      today: [
        CalendarEvent(
          title: 'Maintenance Check',
          description: 'Regular maintenance inspection of the property',
          dateTime: DateTime(today.year, today.month, today.day, 10, 0),
          color: Colors.blue,
          location: 'Building A',
          type: 'Maintenance',
        ),
        CalendarEvent(
          title: 'Tenant Meeting',
          description: 'Discussion about new facilities',
          dateTime: DateTime(today.year, today.month, today.day, 14, 30),
          color: Colors.green,
          location: 'Conference Room',
          type: 'Meeting',
        ),
      ],
      today.add(const Duration(days: 1)): [
        CalendarEvent(
          title: 'Inspection',
          description: 'Safety inspection of premises',
          dateTime: DateTime(today.year, today.month, today.day + 1, 11, 0),
          color: Colors.orange,
          location: 'All Floors',
          type: 'Inspection',
        ),
      ],
    };
  }

  List<CalendarEvent> _getEventsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Calendar',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFF333333)),
            onPressed: () {
              // Handle add event
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              eventLoader: _getEventsForDay,
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay ?? _focusedDay).length,
              itemBuilder: (context, index) {
                final event =
                    _getEventsForDay(_selectedDay ?? _focusedDay)[index];
                return EventCard(
                  onTap: () {},
                  distance: 0,
                  event: {},
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () {
          // Handle add event
        },
      ),
    );
  }
}
