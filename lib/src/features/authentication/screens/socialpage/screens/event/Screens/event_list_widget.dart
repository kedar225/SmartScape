import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/event/Screens/event_screen.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/event/widget/event_card.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';

class EventListScreen extends StatelessWidget {
  // final dark = THelperFunctions.isDarkMode(context);

  List<Map<String, dynamic>> events = [
    {
      'name': 'Music Fest 2024',
      'description': 'An amazing outdoor music festival.',
      'imageUrl': TImage.event1,
      'date': DateTime(2024, 5, 21),
      'location': const LatLng(19.065481173360258, 73.00119469543715),
    },
    {
      'name': 'Food Carnival',
      'description': 'Taste flavors from around the world.',
      'imageUrl': TImage.event2,
      'date': DateTime(2024, 5, 20),
      'location': const LatLng(19.04273008088749, 73.02317113645253),
    },
  ];

  Future<Position> _getUserLocation() async {
    return await Geolocator.getCurrentPosition();
  }

  double _calculateDistance(Position userPosition, LatLng eventLocation) {
    return Geolocator.distanceBetween(
          userPosition.latitude,
          userPosition.longitude,
          eventLocation.latitude,
          eventLocation.longitude,
        ) /
        1000; // in kilometers
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Position>(
        future: _getUserLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text("Error fetching location: ${snapshot.error}"));
          }

          final userPosition = snapshot.data;

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              final distance = userPosition != null
                  ? _calculateDistance(userPosition, event['location'])
                  : 0.0;

              return EventCard(
                event: event,
                distance: distance,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventDetailScreen(event: event),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
