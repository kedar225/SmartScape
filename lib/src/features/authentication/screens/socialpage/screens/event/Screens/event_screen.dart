import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class EventDetailScreen extends StatelessWidget {
  final Map<String, dynamic> event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  event['imageUrl'],
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                event['name'],
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: TColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                event['description'],
                style: TextStyle(
                  color: dark ? Colors.white70 : Colors.black87,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Date: ${event['date'].day}/${event['date'].month}/${event['date'].year}',
                style: const TextStyle(
                  color: TColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle join event action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: const Text(
            'Join Event',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
