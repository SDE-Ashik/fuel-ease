import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fuelease/src/profile/views/profile_views.dart';

class HomeNotifer {
  final hour = DateTime.now().hour;
  static String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good afternoon';
    } else if (hour >= 17 && hour < 20) {
      return 'Good evening';
    } else {
      return 'Good night';
    }
  }
}

