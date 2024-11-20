import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';

class ReportTweetCard extends StatelessWidget {
  final Map<String, dynamic> tweet;
  final double distance;
  final bool isDarkMode;

  const ReportTweetCard({
    super.key,
    required this.tweet,
    required this.distance,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: TColors.primary,
                  child: Text(tweet['name'][0], style: const TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tweet['name'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                    ),
                    Text(
                      tweet['userId'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDarkMode ? Colors.white70 : Colors.black54,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '${distance.toStringAsFixed(1)} km away',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              tweet['title'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              tweet['content'],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                  ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Implement upvote action
                  },
                  icon: const Icon(Icons.thumb_up),
                  color: TColors.primary,
                ),
                IconButton(
                  onPressed: () {
                    // Implement comment action
                  },
                  icon: const Icon(Icons.comment),
                  color: TColors.primary,
                ),
                const Spacer(),
                Icon(
                  Icons.circle,
                  color: tweet['status'] == 'urgent' ? Colors.red : Colors.green,
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
