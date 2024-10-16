// ignore_for_file: prefer_const_constructors

/*
  Classe ActivityCard avec variable (non connue d'avance) activity pemettant d'accéder à l'activité en question 
  définie dans la classe Activity dans activity_card.dart), à l'image et à la ville où elle se déroule (et à l'id) 
  grâce à l'import d'activity_model.dart (classe Activity) 
*/

import 'package:flutter/material.dart';
import 'package:my_trip09_listview/models/activity_model.dart';

class ActivityCard extends StatelessWidget {

  final Activity activity;
  const ActivityCard(
    {
      super.key, 
      required this.activity
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            activity.name
          ),
          Image.asset(
            activity.image, 
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}