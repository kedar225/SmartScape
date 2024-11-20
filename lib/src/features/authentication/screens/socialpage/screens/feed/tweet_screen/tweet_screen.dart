import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart'; // Make sure TColors is correctly imported

class ReportTweetsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> reportTweets;

  const ReportTweetsScreen({super.key, required this.reportTweets});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reports',
          style: TextStyle(
            color: dark ? TColors.light : TColors.dark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ReportTweetListWidget(reportTweets: reportTweets),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define what happens when the button is pressed
          print('Floating action button pressed');
        },
        backgroundColor: TColors.primary,
        child: const Icon(Icons.edit, color: Colors.white), // Pen icon
      ),
    );
  }
}

class ReportTweetListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> reportTweets;

  const ReportTweetListWidget({super.key, required this.reportTweets});

  @override
  Widget build(BuildContext context) {
    // Example widget that lists report tweets
    return ListView.builder(
      itemCount: reportTweets.length,
      itemBuilder: (context, index) {
        final report = reportTweets[index];
        return ListTile(
          title: Text(report['title']),
          subtitle: Text(report['content']),
        );
      },
    );
  }
}
