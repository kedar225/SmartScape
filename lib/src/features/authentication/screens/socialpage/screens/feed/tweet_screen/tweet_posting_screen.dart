import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class TTweetPostingScreen extends StatefulWidget {
  const TTweetPostingScreen({super.key});

  @override
  TTweetPostingScreenState createState() => TTweetPostingScreenState();
}

class TTweetPostingScreenState extends State<TTweetPostingScreen> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController TtitleController = TextEditingController();
  final TextEditingController TdescriptionController = TextEditingController();
  bool TisUrgent = false;
  Position? TuserLocation;
  bool TisLoading = false;
  bool _isLocationLoading = true;
  String? _locationError;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    try {
      // First check location permissions
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _locationError = 'Location services are disabled';
          _isLocationLoading = false;
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _locationError = 'Location permissions are denied';
            _isLocationLoading = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _locationError = 'Location permissions are permanently denied';
          _isLocationLoading = false;
        });
        return;
      }

      // Get location with timeout
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Location request timed out');
        },
      );

      if (mounted) {
        setState(() {
          TuserLocation = position;
          _isLocationLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _locationError = 'Unable to get location: ${e.toString()}';
          _isLocationLoading = false;
        });
      }
    }
  }

  Future<void> TpostTweet() async {
    // Validate input
    if (TtitleController.text.trim().isEmpty || 
        TdescriptionController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Prevent multiple submissions
    if (TisLoading) return;

    setState(() => TisLoading = true);

    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('No authenticated user found');
      }

      // Prepare tweet data
      final tweetData = {
        'userId': currentUser.uid,
        'title': TtitleController.text.trim(),
        'description': TdescriptionController.text.trim(),
        'isUrgent': TisUrgent,
        'timestamp': FieldValue.serverTimestamp(),
      };

      // Add location if available
      if (TuserLocation != null) {
        tweetData['latitude'] = TuserLocation!.latitude;
        tweetData['longitude'] = TuserLocation!.longitude;
      }

      // Post to Firestore with timeout
      await FirebaseFirestore.instance
          .collection('tweets')
          .add(tweetData)
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              throw TimeoutException('Tweet posting timed out');
            },
          );

      if (mounted) {
        Get.back();
        Get.snackbar(
          'Success',
          'Tweet posted successfully',
          backgroundColor: TColors.primary,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      if (mounted) {
        Get.snackbar(
          'Error',
          'Failed to post tweet: ${e.toString()}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } finally {
      if (mounted) {
        setState(() => TisLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return WillPopScope(
      onWillPop: () async {
        if (TisLoading) {
          // Show confirmation dialog if posting is in progress
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Cancel Posting?'),
              content: const Text('Are you sure you want to cancel?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ?? false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: dark ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.close, color: dark ? Colors.white : Colors.black),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'New Tweet',
            style: TextStyle(color: dark ? Colors.white : Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: TtitleController,
                  style: TextStyle(color: dark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Tweet Title',
                    hintStyle:
                        TextStyle(color: dark ? Colors.white70 : Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: TColors.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: TColors.primary.withOpacity(0.5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: TColors.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: TdescriptionController,
                  style: TextStyle(color: dark ? Colors.white : Colors.black),
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Tweet Description',
                    hintStyle:
                        TextStyle(color: dark ? Colors.white70 : Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: TColors.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: TColors.primary.withOpacity(0.5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: TColors.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  title: Text(
                    'Mark as Urgent',
                    style: TextStyle(color: dark ? Colors.white : Colors.black),
                  ),
                  value: TisUrgent,
                  onChanged: (value) => setState(() => TisUrgent = value),
                  activeColor: TColors.primary,
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 10),
                if (_isLocationLoading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (_locationError != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _locationError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                else if (TuserLocation != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Location: ${TuserLocation!.latitude.toStringAsFixed(2)}, ${TuserLocation!.longitude.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: dark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: TisLoading ? null : TpostTweet,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: TisLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Post Tweet',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    TtitleController.dispose();
    TdescriptionController.dispose();
    super.dispose();
  }
}