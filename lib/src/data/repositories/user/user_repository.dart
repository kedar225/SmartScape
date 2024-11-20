import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/utils/helper/firebase_exception.dart';
import 'package:smartscape/src/utils/helper/platform_exception.dart';
import 'package:smartscape/src/utils/helper/user_model.dart';

/// Repository class for user-related operations.

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on user ID.

  // This method is still required based on the comment above but was not written in your pasted code.

  /// Function to update user data in Firestore.
  /// Update any field in specific Users Collection
}
