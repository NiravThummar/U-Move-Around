import 'package:firebase_auth/firebase_auth.dart';
import 'package:u_move_around/models/direction_detail_info.dart';
import 'package:u_move_around/models/user_model.dart';
import 'package:flutter/material.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
userModel? userModelCurrentInfo;
List dList = [];
DirectionDetailsInfo? tripDirectionDetailsInfo;
String? chosenDriverId = "";
String cloudMessagingServerToken =
    'key=AAAAQHxlgIA:APA91bHB8Sw5xgUkDqJl3dzQOiQXvBlFBBrHOnZNWJmfWZPHfcebUsQTgTGLZvMYsq1aKteMPKKro_zXQ7fMBEKKx_hDxLbGN4GLHLw-HFNypNp8moBg5g2UH4IaGYXfpaZOz5P4jAbR';
String userDropOffAddress = "";
String driverCarDetails = "";
String driverName = "";
String driverPhone = "";
double countRatingStar = 0.0;
String titleStarRating = "";

class Global {
  static var textColor = Colors.red;
  static var starColor = Colors.red;
  static var borderColor = Colors.red;
}
