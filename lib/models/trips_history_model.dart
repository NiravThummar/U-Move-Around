import 'package:firebase_database/firebase_database.dart';

class TripsHistoryModel
{
  String? time;
  String? originAddress;
  String? destinationAddress;
  String? status;
  String? fareAmount;
  String? car_details;
  String? driverName;

  TripsHistoryModel({
   this.fareAmount,
   this.driverName,
   this.destinationAddress,
   this.originAddress,
   this.car_details,
   this.status,
   this.time,
});

  TripsHistoryModel.fromSnapshot(DataSnapshot dataSnapshot)
  {
    time = (dataSnapshot.value as Map)["time"];
    originAddress = (dataSnapshot.value as Map)["originAddress"];
    destinationAddress = (dataSnapshot.value as Map)["destinationAddress"];
    status = (dataSnapshot.value as Map)["status"];
    fareAmount = (dataSnapshot.value as Map)["fareAmount"];
    driverName = (dataSnapshot.value as Map)["driverName"];
    car_details = (dataSnapshot.value as Map)["car_details"];
  }
}