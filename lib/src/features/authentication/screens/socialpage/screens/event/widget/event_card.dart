import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;
  final double distance;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.distance,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: dark ? Colors.grey[850] : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  event['imageUrl'],
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                event['name'],
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: TColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                event['description'],
                style: TextStyle(color: dark ? Colors.white70 : Colors.black87),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Distance: ${distance.toStringAsFixed(2)} km',
                    style: const TextStyle(
                      color: TColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${event['date'].day}/${event['date'].month}/${event['date'].year}',
                    style: TextStyle(
                      color: dark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
