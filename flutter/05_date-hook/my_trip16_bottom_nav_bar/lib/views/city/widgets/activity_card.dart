import 'package:flutter/material.dart';
import 'package:my_trip16_bottom_nav_bar/models/activity_model.dart';

class ActivityCard extends StatelessWidget {

  final Activity activity;
  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      // Largeur max.
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          // Text(activity.name),
          Image.asset(
            activity.image, 
            fit: BoxFit.cover,
          ),
        ],
      ),
    );

  }
}