// lib/widgets/tweet_card.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TweetCard extends StatefulWidget {
  final String tweetId;
  final String title;
  final String content;
  final bool isUrgent;
  final GeoPoint location;
  final String userId;
  final Map<String, dynamic> userData;
  final int upvotes;
  final int comments;
  final DateTime timestamp;

  const TweetCard({
    Key? key,
    required this.tweetId,
    required this.title,
    required this.content,
    required this.isUrgent,
    required this.location,
    required this.userId,
    required this.userData,
    required this.upvotes,
    required this.comments,
    required this.timestamp,
  }) : super(key: key);

  @override
  State<TweetCard> createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  String? _distance;
  bool _isUpvoted = false;

  @override
  void initState() {
    super.initState();
    _calculateDistance();
  }

  Future<void> _calculateDistance() async {
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double distanceInMeters = Geolocator.distanceBetween(
        currentPosition.latitude,
        currentPosition.longitude,
        widget.location.latitude,
        widget.location.longitude,
      );

      setState(() {
        if (distanceInMeters < 1000) {
          _distance = '${distanceInMeters.toStringAsFixed(0)}m';
        } else {
          _distance = '${(distanceInMeters / 1000).toStringAsFixed(1)}km';
        }
      });
    } catch (e) {
      print('Error calculating distance: $e');
    }
  }

  void _handleMoreOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.report_outlined),
              title: const Text('Report Tweet'),
              onTap: () {
                // Implement report functionality
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text('Share Tweet'),
              onTap: () {
                // Implement share functionality
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage:
                      widget.userData['ProfilePicture']?.isNotEmpty == true
                          ? NetworkImage(widget.userData['ProfilePicture'])
                          : null,
                  child: widget.userData['ProfilePicture']?.isEmpty == true
                      ? Text(
                          '${widget.userData['FirstName'][0]}${widget.userData['LastName'][0]}',
                          style: TextStyle(color: Colors.grey.shade700),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                // User Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.userData['FirstName']} ${widget.userData['LastName']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '@${widget.userData['Username']}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      if (_distance != null)
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 14,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _distance!,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              DateFormat('MMM d, h:mm a')
                                  .format(widget.timestamp),
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                // More Options Button
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: _handleMoreOptions,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Tweet Content
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Action Buttons Row
            Row(
              children: [
                // Upvote Button
                InkWell(
                  onTap: () {
                    setState(() => _isUpvoted = !_isUpvoted);
                    // Implement upvote functionality with Firebase
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(
                      children: [
                        Icon(
                          _isUpvoted ? Icons.thumb_up : Icons.thumb_up_outlined,
                          size: 20,
                          color: _isUpvoted
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.upvotes.toString(),
                          style: TextStyle(
                            color: _isUpvoted
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Comment Button
                InkWell(
                  onTap: () {
                    // Implement comment functionality
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(
                      children: [
                        const Icon(Icons.chat_bubble_outline,
                            size: 20, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          widget.comments.toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                // Urgency Indicator
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isUrgent ? Colors.red : Colors.green,
                  ),
                ),
                const SizedBox(width: 8),
                // Bell Button
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {
                    // Implement notification functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
