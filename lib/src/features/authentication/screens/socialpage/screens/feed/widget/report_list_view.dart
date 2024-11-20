import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/feed/widget/report_tweet_card.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class ReportTweetListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> reportTweets = [
    {
      'name': 'Kedar Nadkarni',
      'userId': '@VitraKami',
      'location': const LatLng(19.044468, 73.025595),
      'title': 'Road Hazard',
      'content': 'There is a huge pothole on the main street.',
      'status': 'urgent', // can be 'urgent' or 'normal'
    },
    {
      'name': 'Kedar Test1',
      'userId': '@KedarK',
      'location': const LatLng(19.055430, 73.015450),
      'title': 'Street Light Issue',
      'content': 'The street lights on Maple Avenue have been out for a week.',
      'status': 'normal',
    },
    {
      'name': 'Arnav Ambre',
      'userId': '@AmbreArnav',
      'location': const LatLng(19.034270, 73.029320),
      'title': 'Water Leak',
      'content': 'There is a water leak on Oak Road, causing road damage.',
      'status': 'urgent',
    },
    {
      'name': 'Vaibhavi Nakum',
      'userId': '@Nakum123',
      'location': const LatLng(19.045710, 73.030110),
      'title': 'Blocked Drainage',
      'content': 'Heavy rains have blocked the drainage, causing flooding.',
      'status': 'normal',
    },
    // Add more sample tweets here
  ];

  Future<Position> _getUserLocation() async {
    return await Geolocator.getCurrentPosition();
  }

  double _calculateDistance(Position userPosition, LatLng tweetLocation) {
    return Geolocator.distanceBetween(
          userPosition.latitude,
          userPosition.longitude,
          tweetLocation.latitude,
          tweetLocation.longitude,
        ) /
        1000; // distance in kilometers
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

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
            itemCount: reportTweets.length,
            itemBuilder: (context, index) {
              final tweet = reportTweets[index];
              final distance = userPosition != null
                  ? _calculateDistance(userPosition, tweet['location'])
                  : 0.0;

              return ReportTweetCard(
                tweet: tweet,
                distance: distance,
                isDarkMode: dark,
              );
            },
          );
        },
      ),
    );
  }
}
